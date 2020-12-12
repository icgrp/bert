//
// Created by zhiyaot on 7/23/2020.
//

#include <cstdint>
#include <map>
#include "../include/fpga_parse.h"
#include "../include/fpga_type.h"
#include "../include/fpga_helper.h"
#include "../include/fpga_err.h"

using namespace std;
void parse_list(FILE *list, map<uint32_t, std::string> &logical_mapping)
{
    char line[MAX_LINE] = {'\0'};
    char logical[MAX_LINE] = {'\0'};

    uint32_t num{0};

    while (fscanf(list, "%[^\n]\n", line) != EOF)
    {
        if (sscanf(line, "%s -> mem_%d",
                   logical, &num) != 2)
        {
            continue;
        }
        else
        {
            logical_mapping.insert({num, logical});
        }
    }
}

void read_ultra96(FILE *curr, map<uint32_t, unique_ptr<frame_pos>> &bit_map,
                  map<uint32_t, unique_ptr<frame_pos>> &par_bit_map,
                  const char *format)
{
    int check{0};
    char bits[BUFF_SIZE] = {'\0'};
    char buffer[BUFF_SIZE] = {'\0'};
    uint32_t frame_addr{0}, offset{0}, ram_x{0}, ram_y{0}, ram_type{0};
    unsigned int bit_num{0};

    while (check != EOF)
    {
        check = fscanf(curr, format, buffer, &frame_addr, &offset, buffer, buffer, &ram_type, &ram_x, &ram_y, bits);

        if (check != 9)
        {
            fscanf(curr, "%s\n", buffer);
            continue;
        }

        if (sscanf(bits, "BIT%d", &bit_num))
        {
            if (bit_map.find(calc_bit_pos_ultra96(ram_x, ram_y, bit_num, ram_type)) == bit_map.end())
            {
                bit_map.insert({calc_bit_pos_ultra96(ram_x, ram_y, bit_num, ram_type),
                                make_unique<frame_pos>(frame_addr, offset)});
            }
        }
        else
        {
            sscanf(bits, "PARBIT%d", &bit_num) == 1 ? (void)0 : throw "NOT ULTRA_96 LL";
            if (par_bit_map.find(calc_bit_pos_ultra96(ram_x, ram_y, bit_num, ram_type)) == par_bit_map.end())
            {
                par_bit_map.insert({calc_bit_pos_ultra96(ram_x, ram_y, bit_num, ram_type),
                                    make_unique<frame_pos>(frame_addr, offset)});
            }
        }
    }

    fclose(curr);
}

uint32_t get_IDCODE(FILE *file)
{
    uint32_t curr{0};
    uint8_t now{0};

    while (true)
    {
        for (auto i = 0; i < 4; i++)
        {
            now = fgetc(file);
            curr |= now << (3 - i) * 8;
        }

        if (curr == 0x30018001)
        {
            break;
        }
        curr = 0;
    }

    curr = 0;
    for (auto i = 0; i < 4; i++)
    {
        now = fgetc(file);
        curr |= now << (3 - i) * 8;
    }

    cout << "FOUND IDCODE: 0x" << hex << uppercase << setfill('0') << setw(8) << curr << endl;

    fclose(file);

    return curr;
}
