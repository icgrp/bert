#!/bin/sh

#usage compress designname

echo "#include \"$1.h\"" > $1_compress.c
echo "#include \"stdio.h\"" >> $1_compress.c
echo "#include \"compress_generic.c\"" >> $1_compress.c
gcc -c $1_compress.c
gcc -c ultrascale_plus.c
gcc -c $1.c
gcc -o $1_ucompress $1_compress.o $1.o ultrascale_plus.o
./$1_ucompress > $1_compressed.c




