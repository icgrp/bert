#pragma clang diagnostic push
#pragma ide diagnostic ignored "hicpp-exception-baseclass"
#pragma ide diagnostic ignored "misc-throw-by-value-catch-by-reference"
//
// Created by zhiyaot on 7/9/2020.
//
#include <string>
#include <iostream>
#include "../include/fpga_helper.h"
#include "../include/fpga_type.h"

using namespace std;
using namespace bertType;

void findPart(fpga_PL &XfpgaInstance, char *part)
{
    string Xpart{part};

    if (Xpart.find("eg") != string::npos)
    {
        XfpgaInstance.type = fpgaType::Zynq_USp_ZUEG;
        if (Xpart.find("3eg") != string::npos)
        {
            XfpgaInstance.subSeries = 3;
            cout << "Found FPGA type US+3EG" << endl;
        }
        else if (Xpart.find("9eg") != string::npos)
        {
            XfpgaInstance.subSeries = 9;
            cout << "Found FPGA type US+9EG" << endl;
        }
    }
    else if (Xpart.find("xc7") != string::npos)
    {
        XfpgaInstance.type = fpgaType::Zynq7;
        if (Xpart.find("020clg"))
        {
            XfpgaInstance.subSeries = 2;
            cout << "Found FPGA type Zynq7020" << endl;
        }
    }
    ASSERT(llFormat.find(XfpgaInstance.type) != llFormat.end(),
           "Unable to find matching ll expression, unknown FPGA type", fpga_err::NO_SUCH_LL);
    XfpgaInstance.llStrFormat = llFormat.at(XfpgaInstance.type);
}


void calcNFrameRanges_generic(set<uint32_t> &allFrameAddr, list<pair<uint32_t, uint32_t>> &foundRanges,
                              fpga_PL &XfpgaInstance)
{
    ASSERT(!allFrameAddr.empty(), "Zero frames found when finding nframe_ranges", fpga_err::EMPTY_FRAME_SET);
    list<uint32_t> allFrameSorted{allFrameAddr.begin(), allFrameAddr.end()};
    allFrameSorted.sort();
    auto prev = allFrameSorted.front();
    auto curr = prev;
    auto bounds = boundaries.at(XfpgaInstance.type).at(XfpgaInstance.subSeries);

    foundRanges.emplace_back(make_pair(prev, 1));

    for (auto i = allFrameSorted.begin().operator++(); i != allFrameSorted.end(); ++i)
    {
        if (*i != curr + 1 || bounds.find(*i) != bounds.end())
        {
            prev = *i;
            curr = prev;
            foundRanges.emplace_back(make_pair(prev, 1));
            continue;
        }
        curr = *i;
        foundRanges.back().second++;
    }
}


uint64_t calcBitPosition_generic(uint32_t x_pos, uint32_t y_pos, uint32_t bit_num, uint32_t bramType, uint32_t yMax)
{
    if (bramType == 36)
    {
        return (x_pos * yMax + y_pos) * BRAM_SIZE + bit_num;
    }
    else
    {
        return (x_pos * yMax * 2 + y_pos) * BRAM_SIZE / 2 + bit_num;
    }
}

int xilinxSeries7(fpga_PL &XfpgaInstance)
{
 if ((XfpgaInstance.type==fpgaType::Zynq_USp_ZUEG)||
     (XfpgaInstance.type==fpgaType::Zynq_USp_ZUCG)||
     (XfpgaInstance.type==fpgaType::Zynq_USp_ZUEV))
        return(1);
    else
	return(0);
 }

int xilinxUltraScale(fpga_PL &XfpgaInstance)
{
 if ((XfpgaInstance.type==fpgaType::Zynq7)||
     (XfpgaInstance.type==fpgaType::Zynq7s))
        return(1);
    else
	return(0);
 }


#pragma clang diagnostic pop
