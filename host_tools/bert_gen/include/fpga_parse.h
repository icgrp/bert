//
// Created by zhiyaot on 7/23/2020.
//

#ifndef BERT_GEN_FPGA_PARSE_H
#define BERT_GEN_FPGA_PARSE_H

#include <cstdio>
#include <string>
#include <map>

#define MAX_LINE 4096

#include "fpga_type.h"
#include "../include/fpga_err.h"
#include "../include/fpga_type.h"
#include "../include/fpga_helper.h"

void parse_list(FILE* list, std::map<uint32_t, std::string>& logical_mapping);

void read_generic(FILE *curr, map<uint32_t, unique_ptr<bertType::frame_pos>> &bit_map,
                  map<uint32_t, unique_ptr<bertType::frame_pos>> &par_bit_map, int yMax,
                  const char *format, fpga_PL fpga_tag);

uint32_t get_IDCODE(FILE* file);

#endif //BERT_GEN_FPGA_PARSE_H
