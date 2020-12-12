#!/bin/bash

curr="$(realpath "$0")"
bertDir="$(dirname "$curr")"

usage() {
    echo "usage: gen.sh [[-gen dcpFile headerName | [-h] | [-gen_tcl dcpFile] | [-gen_mdd bert.tcl] | [-map_gen wkDir] | [-header_gen wkDir]]"
}

header_gen() {
    $bertDir/bert_gen $baseDir ${headerName}_uncompressed
    cp $bertDir/compress/compress_generic.c $baseDir
    cp $bertDir/compress/ultrascale_plus.? $baseDir
    cp $bertDir/compress/bert_types.h $baseDir
    cd $baseDir
    echo "#include \"${headerName}_uncompressed.h\"" >${headerName}_compress.c
    echo "#include \"stdio.h\"" >>${headerName}_compress.c
    echo "#include \"compress_generic.c\"" >>${headerName}_compress.c
    gcc -c ${headerName}_compress.c
    gcc -c ultrascale_plus.c
    gcc -c ${headerName}_uncompressed.c
    gcc -o ${headerName}_ucompress ${headerName}_compress.o ${headerName}_uncompressed.o ultrascale_plus.o
    ./${headerName}_ucompress >${headerName}.c
    cp ${headerName}_uncompressed.h ${headerName}.h
    rm ultrascale_plus.o ${headerName}_compress.o ${headerName}_uncompressed.o ${headerName}_ucompress

}

map_gen() {
    python3 $bertDir/gen_map.py $baseDir $mddName
}


##### Main

if [ $# -eq 0 ]; then
    usage
fi

while test $# -gt 0; do
    case $1 in
    -h | --help)
        usage
        shift
        exit
        ;;

    -gen)
        if [ $# -gt 1 ]; then
            echo -e "-gen detected...\n"
            shift
            baseDir="$(realpath "$1")"
            shift
            headerName="mydesign"
            shift
            mkdir -p $baseDir/bert_src
            wkDir=$baseDir/bert_src
            #echo -e "[10%] Generating bert.tcl in $wkDir\n"
            #tcl_gen
            #echo -e "[20%] Generated bert.tcl in $wkDir\n"
            #tcl=$wkDir/bert.tcl
            mddName="top.mdd"
            echo -e "[30%] Generating .bram .info mapping in $baseDir\n"
            map_gen
            echo -e "[60%] Generated .bram .info mapping in $baseDir\n"
            echo -e "[60%] Generating header files in $wkDir\n"
	        header_gen
            echo -e "[100%] Generated header files in $baseDir\n"
            echo -e "bert_gen complete, exiting....."
            exit
        else
            usage
            exit
        fi
        ;;

    *)
        echo "Illegal operation"
        usage
        exit
        ;;
    esac
done
