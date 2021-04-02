//
// Created by zhiyaot on 7/9/2020.
//
#include <iostream>
#include <string>
#include <iomanip>
#include <map>
#include <cstdio>
#include <set>

using namespace std;

#ifndef BERT_GEN_FPGA_TYPE_H
#define BERT_GEN_FPGA_TYPE_H


namespace bertType
{
    enum class fpgaType
    {
        Zynq_USp_ZUEG,
        Zynq_USp_ZUCG,
        Zynq_USp_ZUEV,
        Zynq7,
        Zynq7s
    };

    const map<fpgaType, string> llFormat =
            {
                    {fpgaType::Zynq_USp_ZUEG, "Bit %s 0x%x %d %s %s Block=RAMB%d_X%dY%d RAM=B:%s\n"},
                    {fpgaType::Zynq7,         "Bit %s 0x%x   %d Block=RAMB%d_X%dY%d Ram=B:%s\n"}
            };
    const map<fpgaType, map<int, int>> maxYSize =
            {
                    {fpgaType::Zynq_USp_ZUEG, {
                                                      {3, 36},
                                                      {9, 84}
                                              }
                    },
                    {fpgaType::Zynq7,         {
                                                      {2, 30}
                                              }
                    }
            };
    const map<fpgaType, map<int, set<uint32_t>>> boundaries =
            {
                    {fpgaType::Zynq_USp_ZUEG, {
                                                      {
                                                          3,
                                                              {
                                                                      0x01000000, 0x01040000, 0x01080000,
                                                                      0x01000100, 0x01040100, 0x01080100,
                                                                      0x01000200, 0x01040200, 0x01080200,
                                                                      0x01000300, 0x01040300, 0x01080300,
                                                                      0x01000400, 0x01040400, 0x01080400,
                                                                      0x01000500, 0x01040500, 0x01080500
                                                              }
                                                      },
                                                      {
                                                          9,
                                                              {
                                                                      0x01000000, 0x01040000, 0x01080000, 0x010c0000, 0x1100000, 0x1500000,
                                                                      0x01000100, 0x01040100, 0x01080100, 0x010c0010, 0x1100100, 0x1500100,
                                                                      0x01000200, 0x01040200, 0x01080200, 0x010c0020, 0x1100200, 0x1500200,
                                                                      0x01000300, 0x01040300, 0x01080300, 0x010c0030, 0x1100300, 0x1500300,
                                                                      0x01000400, 0x01040400, 0x01080400, 0x010c0040, 0x1100400, 0x1500400,
                                                                      0x01000500, 0x01040500, 0x01080500, 0x010c0050, 0x1100500, 0x1500500,
                                                                      0x01000600, 0x01040600, 0x01080600, 0x010c0060, 0x1100600, 0x1500600,
                                                                      0x01000700, 0x01040700, 0x01080700, 0x010c0070, 0x1100700, 0x1500700,
                                                                      0x01000800, 0x01040800, 0x01080800, 0x010c0080, 0x1100800, 0x1500800,
                                                                      0x01000900, 0x01040900, 0x01080900, 0x010c0090, 0x1100900, 0x1500900,
                                                                      0x01000a00, 0x01040a00, 0x01080a00, 0x010c00a0, 0x1100a00, 0x1500a00,
                                                                      0x01000b00, 0x01040b00, 0x01080b00, 0x010c00b0, 0x1100b00, 0x1500b00,
                                                                      0x01000c00, 0x01040c00, 0x01080c00, 0x010c00c0, 0x1100c00, 0x1500c00
                                                              }
                                                      }
                                              }
                    },
                    {
                        fpgaType::Zynq7, {
                                                 {
                                                     2,
                                                         {
                                                                 0x00c20000, 0x00c20080, 0x00c20100, 0x00c20180, 0x00c20200, 0x00c20280,
                                                                 0x00c00000, 0x00c00080, 0x00c00100, 0x00c00180, 0x00c00200, 0x00c00280,
                                                                 0x00be0000, 0x00be0080, 0x00be0100, 0x00be0180, 0x00be0200, 0x00be0280,
                                                         }
                                                 }
                        }
                    }
            };

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
    } bram;

    typedef struct logical_memory_tag
    {
        logical_memory_tag(int nframe_ranges, int wordlen, int word, int num, int replica) :
                nframe_ranges{nframe_ranges}, wordlen{wordlen}, words{word}, num{num}, replica{replica}
        {}

        int nframe_ranges;
        int wordlen;
        int words;
        int num;
        int replica;
    } logical_memory;

    typedef struct fpgaPL_tag
    {
        int maxYRange;
        int subSeries;
        fpgaType type;
        string llStrFormat;
    } fpga_PL;
}


#endif //BERT_GEN_FPGA_TYPE_H
