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

uint32_t get_IDCODE(FILE* file) {
    uint8_t buff[512];
    fread(buff, 1, 512, file);
    int consecutive = 0;
    int i;
    uint32_t idcode = -1;
    // Get alignment
    for (i = 0; i < 512; i++) {
        if (buff[i] != 0xFF) {
            consecutive = 0;
        } else {
            consecutive++;
        }
        if (consecutive == 32)
            break;
    }
    // Look at each word
    for (i = i + 1; i + 3 < 512; i += 4) {
        uint32_t word = buff[i + 3] | (buff[i + 2] << 8) | (buff[i + 1] << 16) | (buff[i + 0] << 24);
        if (word == 0x30018001) {
            idcode = buff[i + 7] | (buff[i + 6] << 8) | (buff[i + 5] << 16) | (buff[i + 4] << 24);
            break;
        }
    }
    cout << "FOUND IDCODE: 0x" << idcode << endl;
    fclose(file);
    return idcode;
}
