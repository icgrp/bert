#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma ide diagnostic ignored "hicpp-exception-baseclass"
#pragma ide diagnostic ignored "misc-throw-by-value-catch-by-reference"
//
// Created by zhiyaot on 7/17/2020.
//

#include "../include/fpga_gen.h"

#include <cassert>
#include <iostream>
#include <list>
#include <memory>
#include <string>
#include <set>

using namespace std;
using namespace bertType;


//#define USE_DATABASE

void gen_header(const char *path, const char *header_name)
{
    fpga_PL XfpgaInstance;

    stringstream strsteam;
    strsteam.str("");
    strsteam << path << header_name << ".h";
    auto header_h = fopen(strsteam.str().c_str(), "w");
    ASSERT(header_h != nullptr, "Unable to write header file .c",
           fpga_err::FILE_PTR_NULL);

    strsteam.str("");
    strsteam << path << header_name << ".c";
    auto header_c = fopen(strsteam.str().c_str(), "w");
    ASSERT(header_c != nullptr, "Unable to write header file .h", fpga_err::FILE_PTR_NULL);

    strsteam.str("");
    strsteam << path << "/list_of_logical.list";
    auto list = fopen(strsteam.str().c_str(), "r");
    ASSERT(list != nullptr, "Unable locate list_of_logical.list", fpga_err::FILE_PTR_NULL);

    strsteam.str("");
    strsteam << path << "/top.bit";
    auto bitstream = fopen(strsteam.str().c_str(), "rb");
    ASSERT(bitstream != nullptr, "Unable locate bitstream", fpga_err::FILE_PTR_NULL);
    map<uint32_t, string> all_logical;
    char part[MAX_LINE] = {'\0'};
    {

        fscanf(list, "PART->%s\n", part);
        findPart(XfpgaInstance, part);
        XfpgaInstance.maxYRange = maxYSize.at(XfpgaInstance.type).at(XfpgaInstance.subSeries);
    }

    // parsing the list of logical memory to be patched
    parse_list(list, all_logical);
    fclose(list);

    uint32_t part_id = get_IDCODE(bitstream);
    print_preproc(all_logical, header_h, part_id);
    print_preproc(all_logical, header_c, part_id);


    fprintf(header_h, "#define X_PART_NUMBER \"%s\" // this is the part-number for board\n", part);
    if (xilinxSeries7(XfpgaInstance))
      fprintf(header_h,"#define XILINX_SERIES7\n");
    else
      fprintf(header_h,"#undef XILINX_SERIES7\n");
    if (xilinxUltraScale(XfpgaInstance))
      fprintf(header_h,"#define XILINX_ULTRASCALE\n");
    else
      fprintf(header_h,"#undef XILINX_ULTRASCALE\n");
    


    print_header(header_h);
    fclose(header_h);

    std::list<unique_ptr<logical_memory>> logical_memories;

    map<uint32_t, unique_ptr<frame_pos>> bit_map;
    map<bit_pos, unique_ptr<frame_pos>> bit_map2;
    map<uint32_t, unique_ptr<frame_pos>> par_bit_map;

#ifndef USE_DATABASE
    strsteam.str("");
    strsteam << path << "/top.ll";
    auto ll = fopen(strsteam.str().c_str(), "r");
    read_generic(ll, bit_map, par_bit_map, XfpgaInstance.maxYRange, XfpgaInstance.llStrFormat.c_str(), XfpgaInstance);
#endif

    print_logicalNames(header_c, all_logical);
    for (pair<uint32_t, string> logical : all_logical)
    {
        cout << "Compiling mem_" << logical.first << endl;
        print_frame(path, logical, header_c, logical_memories, bit_map, par_bit_map, XfpgaInstance);
    }

    cout << "bert_gen compilation finished!" << endl;

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
                 map<uint32_t, unique_ptr<frame_pos>> &bit_map,
                 map<uint32_t, unique_ptr<frame_pos>> &par_bit_map,
                 fpga_PL XfpgaInstance)
{

    list<unique_ptr<bram>> list_of_bram;
    set<uint32_t> allFrameAddr;

    find_map(path, bit_map, par_bit_map, list_of_bram, logical.first);

    stringstream strsteam;
    strsteam.str("");
    strsteam << path << "/mem_" << logical.first << ".info";
    auto bram_file = fopen(strsteam.str().c_str(), "r");

    char line[1000] = {'\0'};

    uint32_t loc_line{0}, loc_bit{0}, bram_type{0}, bram_x{0},
            bram_y{0}, width{0}, fasm_y{0}, fasm_p{0}, fasm_line{0},
            fasm_bit{0}, bit{0}, offset{0};

    uint32_t bit_tracking{0}, xyz{0};

    uint32_t bram_series{0};

    auto temp_list_of_addr = make_unique<list<pair<uint32_t, uint32_t>>>();
    auto final_list_of_addr = make_unique<list<pair<uint32_t, uint32_t>>>();
    auto replica = 1, curr_rep = 1;
    while (fscanf(bram_file, "%[^\n]\n", line) != EOF)
    {
        if (sscanf(line,
                   "word=%d, bit=%d, loc=RAMB%dE%d_X%dY%d, bits=%d, fasmY=%d, "
                   "fasmINITP=%d, fasmLine=%d, fasmBit=%d, xyz=%d, offset=%d",
                   &loc_line, &loc_bit, &bram_type, &bram_series, &bram_x,
                   &bram_y, &width, &fasm_y, &fasm_p, &fasm_line, &fasm_bit, &bit, &offset) == 13)
        {
            if (curr_rep == replica && (loc_bit != 0 || loc_line != 0)) curr_rep = 1;

            assert(bram_type == 36 || bram_type == 18);


            bram_type == 36 ? xyz = fasm_line * 512 + 2 * fasm_bit + fasm_y + offset
                            : xyz = fasm_line * 256 + fasm_bit + offset / 2;


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
            if (!fasm_p)
            {
                auto curr_bit = bit_map[calcBitPosition_generic(bram_x, bram_y, xyz, bram_type,
                                                                XfpgaInstance.maxYRange)].get();
                if (curr_bit == nullptr)
                {
                    cout << "bram_x:" << bram_x << ", bram_y:" << bram_y << ", xyz:" << xyz << endl;
                }
                ASSERT(curr_bit != nullptr,
                       "Unable to locate frame addr and offset based on given bit position",
                       fpga_err::NO_FRAME_FOUND);
                temp_list_of_addr->emplace_back(curr_bit->frame, curr_bit->offset);
            }
            else
            {
                bram_type == 36 ? xyz = fasm_line * 512 + 2 * fasm_bit + fasm_y + offset / 8
                                : xyz = fasm_line * 256 + fasm_bit + offset / 16;
                auto curr_bit = par_bit_map[calcBitPosition_generic(bram_x, bram_y, xyz, bram_type,
                                                                    XfpgaInstance.maxYRange)].get();
                if (curr_bit == nullptr)
                {
                    cout << "bram_x:" << bram_x << " bram_y:" << bram_y << " xyz:" << xyz << endl;
                }
                ASSERT(curr_bit != nullptr,
                       "Unable to locate frame addr and offset based on given parbit position",
                       fpga_err::NO_FRAME_FOUND);
                temp_list_of_addr->emplace_back(curr_bit->frame, curr_bit->offset);
            }

            if (bit_tracking == width - 1 && curr_rep == replica)
            {
                for (; !temp_list_of_addr->empty();)
                {
                    final_list_of_addr->emplace_back(temp_list_of_addr->front());

                    if (temp_list_of_addr->front().first != 0xFFFFFFFF ||
                        temp_list_of_addr->front().second != static_cast<uint32_t>(-1))
                        allFrameAddr.emplace(temp_list_of_addr->front().first);

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

    list<pair<uint32_t, uint32_t>> foundRanges;
    calcNFrameRanges_generic(allFrameAddr, foundRanges, XfpgaInstance);

    fprintf(header_c, "struct frame_range mem%d_frame_ranges[%ld] =\n", logical.first, foundRanges.size());
    fprintf(header_c, "        {\n");
    logical_memories.emplace_back(make_unique<logical_memory>(foundRanges.size(), width,
                                                              final_list_of_addr->size() / width / replica,
                                                              logical.first, replica));
    foundRanges.sort([](pair<uint32_t, uint32_t> const frame1, pair<uint32_t, uint32_t> const frame2)
                     {
                         ASSERT(frame1.first != frame2.first,
                                "Duplication in Frame starting point",
                                fpga_err::GENERIC); // NOLINT(misc-throw-by-value-catch-by-reference,hicpp-exception-baseclass)
                         return frame1.first < frame2.first;
                     });

    for (auto &curr : foundRanges)
    {
        fprintf(header_c, "                {0x%08x, %d}", curr.first, curr.second);
        if (curr != foundRanges.back())
        {
            fprintf(header_c, ",");
        }
        fprintf(header_c, "\n");
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
    stringstream strstream;
    strstream.str("");
    strstream << path << "/mem_" << mem_num << ".bram";
    auto bram_file = fopen(strstream.str().c_str(), "r");

    char line[MAX_LINE] = {'\0'};
    uint32_t bramType{0}, ram_x{0}, ram_y{0};
    while (fscanf(bram_file, "%[^\n]\n", line) != EOF)
    {
        if (sscanf(line, "RAMB%dE2_X%dY%d", // NOLINT(cert-err34-c)
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

#pragma clang diagnostic pop
