#!/bin/bash

curr="$(realpath "$0")"
bertDir="$(dirname "$curr")"
accelNameAddition="accel"

usage() {
    echo "usage: gen.sh [-na] -gen baseDir"
}

header_gen() {
    # had to add slash -- does this differ across OSes? -- AMD 4/17/2021
    "$bertDir"/bert_gen "$baseDir/" "${headerName}"_uncompressed
    cp "$bertDir"/compress/compress_generic.c "$baseDir"
    cp "$bertDir"/accel/accel_all.c "$baseDir"
    cp "$bertDir"/compress/ultrascale_plus.? "$baseDir"
    cp "$bertDir"/compress/7series.h "$baseDir"
    cp "$bertDir"/compress/bert_types.h "$baseDir"
    cp "$bertDir"/compress/compressed_bert_types.h "$baseDir"
    cd "$baseDir" || exit
    echo "#include \"stdint.h\"" >"${headerName}"_compress.c
    # shellcheck disable=SC2129
    echo "#include \"${headerName}_uncompressed.h\"" >>"${headerName}"_compress.c
    echo "#include \"stdio.h\"" >>"${headerName}"_compress.c
    echo "#include \"compress_generic.c\"" >>"${headerName}"_compress.c
    gcc -c "${headerName}"_compress.c
    gcc -c ultrascale_plus.c
    gcc -c "${headerName}"_uncompressed.c
    gcc -o "${headerName}"_ucompress "${headerName}"_compress.o "${headerName}"_uncompressed.o ultrascale_plus.o
    ./"${headerName}"_ucompress >"${headerName}".c
    sed "s/bert_types/compressed_bert_types/g" <${headerName}_uncompressed.h | sed "s/logical_memory/compressed_logical_memory/g" > ${headerName}.h
    echo "#include \"stdint.h\"" >"${headerName}"_uaccel.c
    # shellcheck disable=SC2129
    echo "#include \"${headerName}.h\"" >>"${headerName}"_uaccel.c
    echo "#include \"stdio.h\"" >>"${headerName}"_uaccel.c
    echo "#include \"accel_all.c\"" >>"${headerName}"_uaccel.c
    # the bert_types.h are different -- this one for compressed file...
    cp "$bertDir"/accel/bert_types.h .
    gcc -c "${headerName}".c
    gcc -c "${headerName}"_uaccel.c
    gcc -o "${headerName}"_uaccel_${accelNameAddition} "${headerName}".o ultrascale_plus.o "${headerName}"_uaccel.o
    ./"${headerName}"_uaccel_${accelNameAddition} "${headerName}"_tables
    mv "${headerName}".c "${headerName}"_header.c
    cat "${headerName}"_header.c "${headerName}"_tables.c  > "${headerName}".c
    rm ultrascale_plus.o "${headerName}"_compress.o "${headerName}"_uncompressed.o "${headerName}"_ucompress "${headerName}"_uaccel.o "${headerName}".o
}

map_gen() {
    python3 "$bertDir"/gen_map.py "$baseDir" "$mddName"
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

    -na | --no_accel)
        accelNameAddition="_noaccel"
        shift
        ;;

    -gen)
        if [ $# -gt 1 ]; then
            echo -e "-gen detected...\n"
            shift
            baseDir="$(realpath "$1")"
            shift
            headerName="mydesign"
            shift
            #mkdir -p $baseDir/bert_src
            #wkDir=$baseDir/bert_src
            #echo -e "[10%] Generating bert.tcl in $wkDir\n"
            #tcl_gen
            #echo -e "[20%] Generated bert.tcl in $wkDir\n"
            #tcl=$wkDir/bert.tcl
            mddName="top.mdd"
            echo -e "[30%] Generating .bram .info mapping in $baseDir\n"
            map_gen
            echo -e "[60%] Generated .bram .info mapping in $baseDir\n"
            echo -e "[60%] Generating header files in $baseDir\n"
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
