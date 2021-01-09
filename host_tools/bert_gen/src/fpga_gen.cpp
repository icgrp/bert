//
// Created by zhiyaot on 7/17/2020.
//

#include "../include/fpga_gen.h"

#include <algorithm>
#include <cassert>
#include <iostream>
#include <list>
#include <memory>
#include <string>

#include "../include/fpga_helper.h"
#include "../include/fpga_type.h"
#include "../include/fpga_parse.h"

using namespace std;

#define _MAX_PATH_LENGTH_ 256
#define _ULTRA96_STYLE_ "Bit %s 0x%x %d %s %s Block=RAMB%d_X%dY%d RAM=B:%s\n"

#ifndef NDEBUG
#define ASSERT(condition, message)                                             \
    do                                                                         \
    {                                                                          \
        if (!(condition))                                                      \
        {                                                                      \
            std::cerr << "Assertion `" #condition "` failed in " << __FILE__   \
                      << " line " << __LINE__ << ": " << message << std::endl; \
            std::terminate();                                                  \
        }                                                                      \
    } while (false)
#else
#define ASSERT(condition, message) \
    do                             \
    {                              \
    } while (false)
#endif

//#define USE_DATABASE

void gen_header(const char *path, const char *header_name)
{
    char filePath[_MAX_PATH_LENGTH_] = {'\0'};
    sprintf(filePath, "%s/%s.h", path, header_name);
    auto header_h = fopen(filePath, "w");
    ASSERT(header_h != nullptr, "Unable to write header file .c");

    sprintf(filePath, "%s/%s.c", path, header_name);
    auto header_c = fopen(filePath, "w");
    ASSERT(header_c != nullptr, "Unable to write header file .h");

    sprintf(filePath, "%s/list_of_logical.list", path);
    auto list = fopen(filePath, "r");
    ASSERT(list != nullptr, "Unable locate list_of_logical.list");

    sprintf(filePath, "%s/top.bit", path);
    auto bitstream = fopen(filePath, "rb");
    ASSERT(bitstream != nullptr, "Unable locate bitstream");
    map<uint32_t, string> all_logical;

    parse_list(list, all_logical);
    fclose(list);

    uint32_t IDCODE = get_IDCODE(bitstream);
    print_preproc(all_logical, header_h, IDCODE);
    print_preproc(all_logical, header_c, IDCODE);

    print_header(header_h);
    fclose(header_h);

    std::list<unique_ptr<logical_memory>> logical_memories;

    map<uint32_t, unique_ptr<frame_pos>> bit_map;
    map<uint32_t, unique_ptr<frame_pos>> par_bit_map;

#ifndef USE_DATABASE
    sprintf(filePath, "%s/top.ll", path);
    auto ll = fopen(filePath, "r");
    read_ultra96(ll, bit_map, par_bit_map, _ULTRA96_STYLE_);
#endif

    print_logicalNames(header_c, all_logical);
    for (pair<uint32_t, string> logical : all_logical)
    {
//        cout << "At mem_" << logical.first << endl;
        print_frame(path, logical, header_c, logical_memories, bit_map, par_bit_map);
    }

    fprintf(header_c, "\n\nstruct logical_memory logical_memories[NUM_LOGICAL] =\n");
    fprintf(header_c, "        {\n");
    while (!logical_memories.empty())
    {
        auto loc_mem = logical_memories.front().get();

        fprintf(header_c, "                {%d, %d, %d, %d, mem%d_frame_ranges, mem%d_bitlocs}",
                loc_mem->nframe_ranges, loc_mem->wordlen, loc_mem->words,
                loc_mem->replica, loc_mem->num, loc_mem->num);
        logical_memories.pop_front();
        if (!logical_memories.empty())
        {
            fprintf(header_c, ",\n");
        }
    }
    fprintf(header_c, "\n        };");
    fclose(header_c);
}

void print_logicalNames(FILE *header_c, map<uint32_t, string> &all_logical)
{
    fprintf(header_c, "const char *logical_names[] =\n");
    fprintf(header_c, "        {\n");

    auto i = 0;
    for (const pair<const unsigned int, basic_string<char>> &logical : all_logical)
    {
        i++;
        fprintf(header_c, "                \"%s\"", logical.second.c_str());
        if (i == all_logical.size())
        {
            continue;
        }
        fprintf(header_c, ",\n");
    }
    fprintf(header_c, "\n        };\n\n\n");
}

void print_preproc(map<uint32_t, string> &all_logical, FILE *outFile, uint32_t IDCODE)
{
    fprintf(outFile, "#include \"bert_types.h\"\n\n");
    fprintf(outFile, "#define NUM_LOGICAL %lu\n\n", all_logical.size());
    fprintf(outFile, "#define PART_ID 0x%08X\n\n", IDCODE);

    int i = 0;
    for (const pair<const unsigned int, basic_string<char>> &logical : all_logical)
    {
        fprintf(outFile, "#define MEM_%d %d\n", logical.first, i);
        i++;
    }
    fprintf(outFile, "\n");
}

void print_header(FILE *header_h)
{
    fprintf(header_h, "extern const char * logical_names[NUM_LOGICAL];\n");
    fprintf(header_h, "extern struct logical_memory logical_memories[NUM_LOGICAL];\n");
}

void print_frame(const char *path, pair<uint32_t, string> &logical, FILE *header_c,
                 list<unique_ptr<logical_memory>> &logical_memories,
                 map<uint32_t, unique_ptr<frame_pos>> &bit_map, map<uint32_t, unique_ptr<frame_pos>> &par_bit_map)
{

    list<unique_ptr<bram>> list_of_bram;

    find_map(path, bit_map, par_bit_map, list_of_bram, logical.first);

    char filePath[_MAX_PATH_LENGTH_] = {'\0'};
    sprintf(filePath, "%s/mem_%d.info", path, logical.first);
    auto bram_file = fopen(filePath, "r");

    char line[1000] = {'\0'};

    uint32_t loc_line{0}, loc_bit{0}, bram_type{0}, bram_x{0},
            bram_y{0}, width{0}, fasm_y{0}, fasm_p{0}, fasm_line{0},
            fasm_bit{0}, bit{0}, offset{0};

    uint32_t bit_tracking{0}, xyz;

    auto temp_list_of_addr = make_unique<list<pair<uint32_t, uint32_t>>>();
    auto final_list_of_addr = make_unique<list<pair<uint32_t, uint32_t>>>();
    auto replica = 1, curr_rep = 1;
    while (fscanf(bram_file, "%[^\n]\n", line) != EOF)
    {

        if (sscanf(line,
                   "word=%d, bit=%d, loc=RAMB%dE2_X%dY%d, bits=%d, fasmY=%d, "
                   "fasmINITP=%d, fasmLine=%d, fasmBit=%d, xyz=%d, offset=%d",
                   &loc_line, &loc_bit, &bram_type, &bram_x,
                   &bram_y, &width, &fasm_y, &fasm_p, &fasm_line, &fasm_bit, &bit, &offset) == 12)
        {
            if (curr_rep == replica && (loc_bit != 0 || loc_line != 0)) curr_rep = 1;

            assert(bram_type == 36 || bram_type == 18);

            //bram_type == 36 ? xyz = fasm_line * 512 + 2 *fasm_bit + fasm_y
            //                : xyz = fasm_line * 256 + fasm_bit;
            // AMD: 12/10/2020 -- guess on what should be doing with offset.
            //   (little unclear if offset is defined properly for this.
            //       maybe should be 36K*(frac) rather than 32K?
            //       may need to adjust.
            bram_type == 36 ? xyz = fasm_line * 512 + 2 * fasm_bit + fasm_y + offset
                            : xyz = fasm_line * 256 + fasm_bit + offset / 2;

//            if (fasm_p)
//            {
//                bram_type == 36 ? xyz = fasm_line * 512 + 2 * fasm_bit + fasm_y + offset / 8
//                                : xyz = fasm_line * 256 + fasm_bit + offset / 16;
//            }

            if (bit_tracking == loc_bit + 1 && loc_line == 0 && loc_bit == 0)
            {
                replica++;
            }

            if (bit_tracking == loc_bit + 1)
            {
                curr_rep++;
                bit_tracking = loc_bit;
            }
            else
            {
                assert(replica >= curr_rep);
            }

            if (bit_tracking != loc_bit)
            {
                curr_rep = replica;
                for (int i = 0; i < (loc_bit - bit_tracking) * replica; ++i)
                {
                    temp_list_of_addr->emplace_back(-1, -1);
                }
                bit_tracking = loc_bit;
            }
            // AMD: 12/10/2020 -- believe this is why nothing showing up with a large (non-zero) offset
            //   if it had another function, not sure what that was.
            //if (xyz >= offset)
            if (!fasm_p)
            {
                auto curr_bit = bit_map[calc_bit_pos_ultra96(bram_x, bram_y, xyz, bram_type)].get();
                if (curr_bit == nullptr)
                {
                    cout << "bram_x:" << bram_x << ", bram_y:" << bram_y << ", xyz:" << xyz  << endl;
                }
                ASSERT(curr_bit != nullptr, "NULL pointer detected in bit_map");
                temp_list_of_addr->emplace_back(curr_bit->frame, curr_bit->offset);
            }
            else
            {
                bram_type == 36 ? xyz = fasm_line * 512 + 2 * fasm_bit + fasm_y + offset / 8
                                : xyz = fasm_line * 256 + fasm_bit + offset / 16;
                auto curr_bit = par_bit_map[calc_bit_pos_ultra96(bram_x, bram_y, xyz, bram_type)].get();
                if (curr_bit == nullptr)
                {
                    cout << "bram_x:" << bram_x << " bram_y:" << bram_y << " xyz:" << xyz << endl;
                }
                ASSERT(curr_bit != nullptr, "NULL pointer detected in par_bit_map");
                temp_list_of_addr->emplace_back(curr_bit->frame, curr_bit->offset);
            }

            if (bit_tracking == width - 1 && curr_rep == replica)
            {
                for (; !temp_list_of_addr->empty();)
                {
                    final_list_of_addr->emplace_back(temp_list_of_addr->front());
                    temp_list_of_addr->pop_front();
                }
                bit_tracking = 0;
            }
            else
            {
                bit_tracking++;
            }
        }
    }

    fprintf(header_c, "struct bit_loc mem%d_bitlocs[%zu] =\n", logical.first, final_list_of_addr->size());
    fprintf(header_c, "        {\n");

    for (auto i = final_list_of_addr->begin(); i != final_list_of_addr->end(); i++)
    {
        fprintf(header_c, "                {0x%08x, %d}", i->first, i->second);
        if (i != final_list_of_addr->end() && next(i) != final_list_of_addr->end())
        {
            fprintf(header_c, ",");
        }
        fprintf(header_c, "\n");
    }

    fprintf(header_c, "\n        };\n\n");

    vector<vector<int>> bram_marker = {{0, 0, 0},
                                       {0, 0, 0},
                                       {0, 0, 0},
                                       {0, 0, 0},
                                       {0, 0, 0},
                                       {0, 0, 0}};

    calc_nframe_range(list_of_bram, bram_marker);

    int nframe_range{0};
    for (const auto &vert : bram_marker)
    {
        for (auto tile : vert)
        {
            if (tile == 1)
            {
                nframe_range++;
            }
        }
    }

    // AMD 12/10/2020 -- maybe recompute in compress.
    //  maybe useful to keep this as an upper-bound on frame ranges to feed into compress case?
    fprintf(header_c, "struct frame_range mem%d_frame_ranges[%d] =\n", logical.first, nframe_range);
    fprintf(header_c, "        {\n");
    logical_memories.emplace_back(make_unique<logical_memory>(nframe_range, width,
                                                              final_list_of_addr->size() / width / replica,
                                                              logical.first, replica));

    for (int i = 0; i < 6; ++i)
    {
        for (int j = 0; j < 3; ++j)
        {
            if (bram_marker[i][j] == 1)
            {
                nframe_range--;
                fprintf(header_c, "                {0x%08x, %d}", minFrame[i][j],
                        256); // AMD 12/10/2020 -- not always 256
                if (nframe_range != 0)
                {
                    fprintf(header_c, ",");
                }
                fprintf(header_c, "\n");
            }
        }
    }
    fprintf(header_c, "        };\n\n");

#if defined(USE_DATABASE)
    bit_map.clear();
    par_bit_map.clear();
    final_list_of_addr->clear();
    temp_list_of_addr->clear();
#endif
}

void find_map(const char *path, map<uint32_t, unique_ptr<frame_pos>> &bit_map,
              map<uint32_t, unique_ptr<frame_pos>> &par_bit_map,
              list<unique_ptr<bram>> &list_of_bram, uint32_t mem_num)
{

    char filePath[_MAX_PATH_LENGTH_] = {'\0'};
    sprintf(filePath, "%s/mem_%d.bram", path, mem_num);
    auto bram_file = fopen(filePath, "r");

    char line[MAX_LINE] = {'\0'};
    uint32_t bramType{0}, ram_x{0}, ram_y{0};
    while (fscanf(bram_file, "%[^\n]\n", line) != EOF)
    {
        if (sscanf(line, "RAMB%dE2_X%dY%d",
                   &bramType, &ram_x, &ram_y) != 3)
        {
            continue;
        }
        else
        {
            list_of_bram.emplace_back(make_unique<bram>(bramType, ram_x, ram_y));
        }
    }
    fclose(bram_file);

    list_of_bram.unique();

#if defined(USE_DATABASE)
    for (auto &bram : list_of_bram)
    {
        sprintf(filePath, "./data/ll_%d/RAMB%d_X%dY%d.ll",
                bram->ramType, bram->ramType, bram->ram_pos_x, bram->ram_pos_y);
        auto ll = fopen(filePath, "r");
        read_ultra96(ll, bit_map, par_bit_map, _ULTRA96_STYLE_);
    }
#endif
}
