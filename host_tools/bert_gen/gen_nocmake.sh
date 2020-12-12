#!/bin/bash

# blah, how generalize this
#bertDir=/home/andre/idev/bert
bertDir=..

usage()
{
    echo "usage: gen_nocmake.sh [[-gen baseDir mddName headerName] | [-h]]"
}

gen()
{
    python3 $bertDir/bert_gen/gen_map.py $baseDir $mddName
    # cmake CMakeLists.txt
    #make clean
    #make
    $bertDir/bert_gen/bert_gen $baseDir ${headerName}_uncompressed
    cp $bertDir/bert_gen/compress/compress_generic.c $baseDir
    cp $bertDir/bert_gen/compress/ultrascale_plus.? $baseDir
    cp $bertDir/bert_gen/compress/bert_types.h $baseDir
    cd $baseDir
    echo "#include \"${headerName}_uncompressed.h\"" > ${headerName}_compress.c
    echo "#include \"stdio.h\"" >> ${headerName}_compress.c
    echo "#include \"compress_generic.c\"" >> ${headerName}_compress.c
    gcc -c ${headerName}_compress.c
    gcc -c ultrascale_plus.c
    gcc -c ${headerName}_uncompressed.c
    gcc -o ${headerName}_ucompress ${headerName}_compress.o ${headerName}_uncompressed.o ultrascale_plus.o
    ./${headerName}_ucompress > ${headerName}.c
    cp ${headerName}_uncompressed.h ${headerName}.h
    rm ultrascale_plus.o ${headerName}_compress.o ${headerName}_uncompressed.o ${headerName}_ucompress

    
    
}

##### Main
if [ $# -eq 0 ]
then
    usage
fi

while test $# -gt 0; do
    case $1 in
        -h | --help )
            usage
            shift
            ;;
        
        -gen )
	    if [ $# -gt 3 ]
	       then
                 shift
                 baseDir=$1
                 shift
                 mddName=$1
                 shift
                 headerName=$1
                 shift
                 gen
            else
		usage
		exit
            fi		
            ;;

        * )
            echo "Illegal operation"
            usage
            exit
            ;;
    esac
done
        
