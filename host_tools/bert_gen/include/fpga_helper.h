//
// Created by zhiyaot on 7/9/2020.
//
#include <cstdio>
#include <iostream>
#include <string>
#include <iomanip>
#include <list>
#include <map>
#include <vector>
#include <set>
#include "fpga_type.h"
#include "fpga_err.h"

#ifndef BERT_GEN_FPGA_HELPER_H
#define BERT_GEN_FPGA_HELPER_H

using namespace bertType;
using namespace std;

const int BRAM_SIZE = 36864;

uint64_t calcBitPosition_generic(uint32_t x_pos, uint32_t y_pos, uint32_t bit_num, uint32_t bramType, uint32_t yMax);

void calcNFrameRanges_generic(set<uint32_t> &allFrameAddr, list <pair<uint32_t, uint32_t>> &foundRanges,
                              fpga_PL &XfpgaInstance);

void findPart(fpga_PL &XfpgaInstance, char* part);

void int xilinxSeries7(fpga_PL &XfpgaInstance);
void int xilinxUltraScale(fpga_PL &XfpgaInstance);

#endif //BERT_GEN_FPGA_HELPER_H
