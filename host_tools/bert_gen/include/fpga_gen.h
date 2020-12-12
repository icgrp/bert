//
// Created by zhiyaot on 7/17/2020.
//

#ifndef BERT_GEN_FPGA_GEN_H
#define BERT_GEN_FPGA_GEN_H

#include <algorithm>
#include <cassert>
#include <cstring>
#include <iostream>
#include <list>
#include <string>

#include "../include/fpga_type.h"

using namespace std;

/*
 * This part of the code encapsulate the generation of the .c file and .h file
 * as the product of the BERT compilation
 */

void gen_header(const char *path, const char *header_name);

void print_preproc(map<uint32_t, string> &all_logical, FILE *outFile, uint32_t IDCODE);

void print_header(FILE *header_h);

void print_logicalNames(FILE *header_c, map<uint32_t, string> &all_logical);

void print_frame(const char *path, pair<uint32_t, string> &logical, FILE *header_c,
                 list<unique_ptr<logical_memory>> &logical_memories,
                 map<uint32_t, unique_ptr<frame_pos>> &bit_map, map<uint32_t, unique_ptr<frame_pos>> &par_bit_map);

void find_map(const char *path, map<uint32_t, unique_ptr<frame_pos>> &bit_map,
              map<uint32_t, unique_ptr<frame_pos>> &par_bit_map, list<unique_ptr<bram>> &list_of_bram,
              uint32_t mem_num);

#endif //BERT_GEN_FPGA_GEN_H
