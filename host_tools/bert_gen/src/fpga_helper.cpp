//
// Created by zhiyaot on 7/9/2020.
//
#include <string>
#include <iomanip>
#include "../include/fpga_helper.h"
#include "../include/fpga_type.h"

int minFrame[6][3] = {{0x01000000, 0x01040000, 0x01080000},
                      {0x01000100, 0x01040100, 0x01080100},
                      {0x01000200, 0x01040200, 0x01080200},
                      {0x01000300, 0x01040300, 0x01080300},
                      {0x01000400, 0x01040400, 0x01080400},
                      {0x01000500, 0x01040500, 0x01080500}};

uint64_t calc_bit_pos_ultra96(uint32_t x_pos, uint32_t y_pos, uint32_t bit_num, uint32_t type)
{
    if (type == 36)
    {
        return (x_pos * 36 + y_pos) * BRAM_SIZE + bit_num;
    }
    else
    {
        return (x_pos * 72 + y_pos) * BRAM_SIZE / 2 + bit_num;
    }
}

void calc_nframe_range(list<unique_ptr<bram>> &all_logical, vector<vector<int>> &range_mark)
{
    for (auto &bram : all_logical)
    {
        if (bram->ramType == 36)
        {
            range_mark[bram->ram_pos_x][bram->ram_pos_y / 12] = 1;
        }
        else
        {
            range_mark[bram->ram_pos_x][bram->ram_pos_y / 24] = 1;
        }
    }
}
