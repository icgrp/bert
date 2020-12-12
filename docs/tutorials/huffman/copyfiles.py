#cp ../../../embedded/src/bert/* $1/huffman_demo/src
#cp ../../../docs/tutorials/huffman/sw_huffman/* $1/huffman_demo/src

import os.path
import pathlib
import argparse
import glob
import shutil
import sys

# The routine createBitMappings() above is intended to be called from other programs which require the mappings.
# This main routine below is designed to test it
if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("workDir", help='Directory which tutorial refers to as WORK and where provided files were copied to.  Example: /home/steven/myProject.  Assumes SDKWorkspace is subdirectory of this.')

    args = parser.parse_args()

    bertDir = pathlib.Path(sys.path[0]).resolve().parent.parent.parent
    workDir = pathlib.Path(args.workDir).resolve()
    sdkDir  = workDir / "SDKWorkspace"
    
    # Check that all directories exist
    bertSrcDir = bertDir / "embedded" / "src" / "bert"
    bertSWHuffmanDir = bertDir / "docs" / "tutorials" / "huffman" / "sw_huffman"
    bertBspDir = bertDir / "embedded" / "libsrc" / "xilfpga_v5_1" / "src"
    assert os.path.isdir(str(bertDir))
    assert os.path.isdir(str(bertSrcDir))
    assert os.path.isdir(str(bertSWHuffmanDir))
    assert os.path.isdir(str(bertBspDir))

    assert os.path.isdir(str(workDir)) 
    appSrcDir = sdkDir / "huffman_demo" / "src"
    assert os.path.isdir(str(appSrcDir))

    appBspDir = sdkDir / "huffman_demo_bsp" / "psu_cortexa53_0" / "libsrc" / "xilfpga_v5_1" / "src"
    assert os.path.isdir(str(appBspDir))

    print("Step 1. Copying files from '{}' to \n                           '{}'".format(bertBspDir, appBspDir))
    for name in glob.glob(str(bertBspDir / '*')):
        print("    Copying: {}".format(name))
        shutil.copy2(name, str(appBspDir))
    print("Step 2. Copying files from '{}' to \n                           '{}'".format(bertSrcDir, appSrcDir))
    for name in glob.glob(str(bertSrcDir / '*')):
        print("    Copying: {}".format(name))
        shutil.copy2(name, str(appSrcDir))
    print("Step 3. Copying files from '{}' to \n                           '{}'".format(bertSWHuffmanDir, appSrcDir))
    for name in glob.glob(str(bertSWHuffmanDir / '*')):
        print("    Copying: {}".format(name))
        shutil.copy2(name, str(appSrcDir))
    print("Step 4. Copying files from '{}' to \n                           '{}'".format(workDir, appSrcDir))
    for name in glob.glob(str(workDir / 'mydesign.*')):
        print("    Copying: {}".format(name))
        shutil.copy2(name, str(appSrcDir))
