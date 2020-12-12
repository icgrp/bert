//
// Created by zhiyaot on 7/9/2020.
//
#include <iostream>
#include <string>
#include <iomanip>
#include <map>
#include <cstdio>

using namespace std;

#ifndef BERT_GEN_FPGA_TYPE_H
#define BERT_GEN_FPGA_TYPE_H


typedef struct bit_pos_tag
{
    bit_pos_tag(uint16_t ram_x_pos, uint16_t ram_y_pos, uint32_t bit_num) :
            ram_x_pos{ram_x_pos}, ram_y_pos{ram_y_pos}, bit_num{bit_num}
    {}

    uint16_t ram_x_pos;
    uint16_t ram_y_pos;
    uint32_t bit_num;
} bit_pos;

typedef struct frame_pos_tag
{
    frame_pos_tag(uint32_t frame, uint32_t offset) : frame{frame}, offset{offset}
    {}

    uint32_t frame;
    uint32_t offset;

} frame_pos;

typedef struct fasm_pos_tag
{
    fasm_pos_tag(uint16_t fasm_line, uint16_t fasm_bit, uint32_t y) :
            fasm_line{fasm_line}, fasm_bit{fasm_bit}, y{y}
    {}

    uint16_t fasm_line;
    uint16_t fasm_bit;
    uint32_t y;
} fasm_pos;

typedef struct byu_info_tag
{
    byu_info_tag(uint32_t loc_bit, uint32_t loc_line, uint32_t ram_x, uint32_t ram_y, bool p) :
            loc_bit{loc_bit}, loc_line{loc_line}, ram_x{ram_x}, ram_y{ram_y}, p{p}
    {}

    uint32_t loc_bit;
    uint32_t loc_line;
    uint32_t ram_x;
    uint32_t ram_y;
    bool p;
} byu_info;

typedef struct bram_marker_tag
{

    uint32_t num_of_logical;
    map<unsigned int, string> logical_names;

} bram_marker;

typedef struct bram_tag
{
    bram_tag(uint32_t ramType, uint32_t ram_pos_x, uint32_t ram_pos_y) : ramType{ramType}, ram_pos_x{ram_pos_x},
                                                                         ram_pos_y{ram_pos_y}
    {}

    uint32_t ramType;
    uint32_t ram_pos_x;
    uint32_t ram_pos_y;
    uint32_t curr_bit = 0;
    uint32_t curr_par_bit = 0;
} bram;

typedef struct logical_memory
{
    logical_memory(int nframe_ranges, int wordlen, int word, int num, int replica) :
    nframe_ranges{nframe_ranges}, wordlen{wordlen}, words{word}, num{num}, replica{replica}
    {}

    int nframe_ranges;
    int wordlen;
    int words;
    int num;
    int replica;
} logical_memory;


#endif //BERT_GEN_FPGA_TYPE_H
