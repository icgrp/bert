#include <iostream>

#include "include/fpga_gen.h"
#include "include/fpga_helper.h"
#include "include/fpga_type.h"

#define _ULTRA96_STYLE_ "Bit %s 0x%x %d %s %s Block=RAMB%d_X%dY%d RAM=B:%s\n"

using namespace std;

int main(int argc, char **argv)
{
    if (argc == 1 || argc == 2)
    {
        cerr << "insufficient parameter" << endl;
        exit(1);
    }

    gen_header(argv[1], argv[2]);
}
