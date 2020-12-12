//
// Created by zhiyaot on 7/23/2020.
//

#ifndef BERT_GEN_FPGA_PARSE_H
#define BERT_GEN_FPGA_PARSE_H

#include <cstdio>
#include <string>
#include <map>

#define BUFF_SIZE 1024
#define MAX_LINE 4096

#include "fpga_type.h"

void parse_list(FILE* list, std::map<uint32_t, std::string>& logical_mapping);

void read_ultra96(FILE *curr, map<uint32_t, unique_ptr<frame_pos>> &bit_map,
                  map<uint32_t, unique_ptr<frame_pos>> &par_bit_map,
                  const char *format = "Bit %s 0x%x %d %s %s Block=RAMB%d_X%dY%d RAM=B:%s\n");

uint32_t get_IDCODE(FILE* file);

#endif //BERT_GEN_FPGA_PARSE_H
