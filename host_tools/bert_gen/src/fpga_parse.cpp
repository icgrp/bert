//
// Created by zhiyaot on 7/23/2020.
//

#include "../include/fpga_parse.h"

#include <cstdint>
#include <map>


using namespace std;
using namespace bertType;

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

void read_generic(FILE *curr, map<uint32_t, unique_ptr<frame_pos>> &bit_map,
                  map<uint32_t, unique_ptr<frame_pos>> &par_bit_map, int yMax,
                  const char *format, fpga_PL fpga_tag)
{
    int check{0}, check_flag{0};
    char bits[MAX_LINE] = {'\0'};
    char buffer[MAX_LINE] = {'\0'};
    uint32_t frame_addr{0}, offset{0}, ram_x{0}, ram_y{0}, ram_type{0};
    unsigned int bit_num{0};

    while (check != EOF)
    {
        if (fpga_tag.type == fpgaType::Zynq_USp_ZUEG)
        {
            check = fscanf(curr, format, buffer, &frame_addr, &offset, buffer, buffer, &ram_type, &ram_x, &ram_y, bits);
            check_flag = 9;
        }
        else if (fpga_tag.type == fpgaType::Zynq7)
        {
            check = fscanf(curr, format, buffer, &frame_addr, &offset, &ram_type, &ram_x, &ram_y, bits);
            check_flag = 7;
        }

        if (check != check_flag)
        {
            fscanf(curr, "%s\n", buffer);
            continue;
        }

        if (sscanf(bits, "BIT%d", &bit_num)) // NOLINT(cert-err34-c)
        {
            if (bit_map.find(calcBitPosition_generic(ram_x, ram_y, bit_num, ram_type, yMax)) == bit_map.end())
            {
                bit_map.insert({calcBitPosition_generic(ram_x, ram_y, bit_num, ram_type, yMax),
                                make_unique<frame_pos>(frame_addr, offset)});
            }
        }
        else
        {
            sscanf(bits, "PARBIT%d", &bit_num) == 1 ? (void) 0 : throw fpga_err::NOT_STORED_LL; // NOLINT(cert-err34-c)
            if (par_bit_map.find(calcBitPosition_generic(ram_x, ram_y, bit_num, ram_type, yMax)) == par_bit_map.end())
            {
                par_bit_map.insert({calcBitPosition_generic(ram_x, ram_y, bit_num, ram_type, yMax),
                                    make_unique<frame_pos>(frame_addr, offset)});
            }
        }
    }

    fclose(curr);
}

uint32_t get_IDCODE(FILE *file)
{
    uint8_t buff[512];
    fread(buff, 1, 512, file);
    int consecutive = 0;
    int i;
    uint32_t idcode = -1;
    // Get alignment
    for (i = 0; i < 512; i++)
    {
        if (buff[i] != 0xFF)
        {
            consecutive = 0;
        }
        else
        {
            consecutive++;
        }
        if (consecutive == 32)
            break;
    }
    // Look at each word
    for (i = i + 1; i + 3 < 512; i += 4)
    {
        uint32_t word = buff[i + 3] | (buff[i + 2] << 8) | (buff[i + 1] << 16) | (buff[i + 0] << 24);
        if (word == 0x30018001)
        {
            idcode = buff[i + 7] | (buff[i + 6] << 8) | (buff[i + 5] << 16) | (buff[i + 4] << 24);
            break;
        }
    }
    cout << "FOUND IDCODE: 0x" << idcode << endl;
    fclose(file);
    return idcode;
}
