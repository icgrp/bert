#!/bin/bash

curr="$(realpath "$0")"
bertDir="$(dirname "$curr")"

usage() {
    echo "usage: gen.sh [[-gen dcpFile headerName | [-h] | [-gen_tcl dcpFile] | [-gen_mdd bert.tcl] | [-map_gen wkDir] | [-header_gen wkDir]]"
}

header_gen() {
    # cmake CMakeLists.txt
    #make clean
    #make
    $bertDir/bert_gen $wkDir ${headerName}_uncompressed
    cp $bertDir/compress/compress_generic.c $wkDir
    cp $bertDir/compress/ultrascale_plus.? $wkDir
    cp $bertDir/compress/bert_types.h $wkDir
    cd $wkDir
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
    python3 $bertDir/gen_map.py $wkDir $mddName
}

call_vivado() {
    command -v vivado >/dev/null 2>&1 || ( echo "-gen_mdd failed, vivado is not defined (run settings64.sh)" && exit )
    vivado -mode batch -source $tcl
}

tcl_gen() {
    rm -f $wkDir/*
    echo "open_checkpoint $dcp" >$wkDir/bert.tcl
    echo "source $wkDir/mdd_make.tcl" >>$wkDir/bert.tcl
    echo "mddMake $wkDir/top" >>$wkDir/bert.tcl
    echo "write_bitstream -force -logic_location_file $wkDir/top" >>$wkDir/bert.tcl

    cp $bertDir/src/mdd_make.tcl $wkDir
}

##### Main

# Check for $Xilinx is defined

command -v vivado >/dev/null 2>&1 && echo "Check: \$Xilinx is defined (Successful)" || ( echo "Check: vivado not found [source settings64.sh] (Unsuccessful)" && echo -e "Notice bert_gen will not generate mdd at this phase\n")

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
        if [ $# -gt 2 ]; then
            echo -e "-gen detected...\n"
            shift
            dcp="$(realpath "$1")"
            shift
            headerName=$1
            shift
            baseDir="$(dirname "$dcp")"
            mkdir -p $baseDir/bert_src
            wkDir=$baseDir/bert_src
            echo -e "[10%] Generating bert.tcl in $wkDir\n"
            tcl_gen
            echo -e "[20%] Generated bert.tcl in $wkDir\n"
            tcl=$wkDir/bert.tcl
            echo -e "[20%] Generating top.bit top.mdd top.ll in $wkDir\n"
            call_vivado
            echo -e "[50%] Generated top.bit top.mdd top.ll in $wkDir\n"
            mddName="top.mdd"
            echo -e "[50%] Generating .bram .info mapping in $wkDir\n"
            map_gen
            echo -e "[80%] Generated .bram .info mapping in $wkDir\n"
            echo -e "[80%] Generating header files in $wkDir\n"
            #$bertDir/bert_gen $wkDir ${headerName}_uncompressed
	    header_gen
            echo -e "[100%] Generated header files in $wkDir\n"
            echo -e "bert_gen complete, exiting....."
            exit
        else
            usage
            exit
        fi
        ;;

    -gen_tcl)
        if [ $# -gt 1 ]; then
            shift
            dcp="$(realpath "$1")"
            shift
            baseDir="$(dirname "$dcp")"
            mkdir -p $baseDir/bert_src
            wkDir=$baseDir/bert_src
            tcl_gen
            exit
        else
            usage
            exit
        fi
        ;;

    -gen_mdd)
        if [ $# -gt 1 ]; then
            shift
            tcl="$(realpath "$1")"
            shift
            call_vivado
            exit
        else
            usage
            exit
        fi
        ;;

    -map_gen)
        if [ $# -gt 1 ]; then
            shift
            wkdir=$1
            shift
            mddName="top.mdd"
            shift
            map_gen
            exit
        else
            usage
            exit
        fi
        ;;

    -header_gen)
        if [ $# -gt 1 ]; then
            shift
            wkdir=$1
            shift
            headerName=$1
            shift
            $bertDir/bert_gen $wkDir ${headerName}_uncompressed
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
