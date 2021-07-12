#include <iostream>

#include "include/fpga_gen.h"
#include "include/fpga_helper.h"
#include "include/fpga_type.h"


#define _ULTRA96_STYLE_ "Bit %s 0x%x %d %s %s Block=RAMB%d_X%dY%d RAM=B:%s\n"

using namespace std;
using namespace Color;


void print_usage()
{
    cerr << Modifier{Code::FG_MAGENTA} << Modifier{Code::SET_BOLD};
    cerr << "[Usage]: " << Modifier{Code::RESET_ALL};

    cerr << "bert_gen - an xbert dedicated FPGA resource header generator" << endl << endl;

    cerr << Modifier{Code::FG_CYAN};
    cerr << "         ./bert_gen [path] [headerName]" << endl << endl;
    cerr << Modifier{Code::RESET_ALL};

    cerr << "         [path]           Path to folder that has bert resources from file_gen.tcl" << endl;
    cerr << "         [headerName]     Custom header name for generated resource header" << endl;
}

int main(int argc, char **argv)
{
    Modifier red{Code::FG_RED};
    Modifier magenta{Code::FG_MAGENTA};
    Modifier normal{Code::RESET_ALL};
    Modifier bold{Code::SET_BOLD};

    if (argc == 1 || argc == 2)
    {
        cerr << red << bold << "[ERROR]: " << normal;
        cerr << "insufficient parameter" << endl << endl;
        print_usage();
        exit(1);
    }
    else if (argc > 3)
    {
        cerr << magenta << bold << "[Warning]: " << normal;
        cerr << "too much parameter, extra input will be ignored" << endl;
    }

    try
    {
        gen_header(argv[1], argv[2]);
    }
    catch (fpga_err e)
    {
        cerr << red << bold << "[ERROR]: " << normal;
        switch (e)
        {
            case fpga_err::NOT_STORED_LL:
                cerr << "LL file has incorrect reading format" << endl;
                break;
            case fpga_err::FILE_PTR_NULL:
                cerr << "file pointer specified returned null" << endl;
                break;
            case fpga_err::NO_SUCH_LL:
                cerr << "no such ll file stored in the system" << endl;
                break;
            default:
                cerr << "I have not handle these errors T_T orz" << endl;
                break;
        }
    }
}
