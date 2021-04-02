import os.path
import pathlib
import argparse
import glob
import shutil
import sys

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("workDir", help='Directory which tutorial refers to as WORK and where provided files were copied to.  Example: /home/steven/myProject.  Assumes SDKWorkspace is subdirectory of this.')

    args = parser.parse_args()

    bertDir = pathlib.Path(sys.path[0]).resolve().parent.parent.parent
    assert os.path.isdir(str(bertDir)), "Cannot find directory: " + bertDir
    workDir = pathlib.Path(args.workDir).resolve()
    sdkDir  = workDir
    
    # Check that all directories exist
    bertSrcDir = bertDir / "embedded" / "src" / "bert"
    assert os.path.isdir(str(bertSrcDir)), "Cannot find directory: " + bertSrcDir
    bertSWHuffmanDir = bertDir / "docs" / "tutorials" / "huffman" / "sw_huffman_vitis"
    assert os.path.isdir(str(bertSWHuffmanDir)), "Cannot find directory: " + bertSWHuffmanDir

    assert os.path.isdir(str(workDir)), "Cannot find directory: " + workDir 
    appSrcDir = sdkDir / "huffman_demo" / "src"
    assert os.path.isdir(str(appSrcDir)), "Cannot find directory: " + appSrcDir

    print("Step 1. Copying files from '{}' to \n                           '{}'".format(bertSrcDir, appSrcDir))
    for name in glob.glob(str(bertSrcDir / '*')):
        print("    Copying: {}".format(name))
        shutil.copy2(name, str(appSrcDir))
    print("Step 2. Copying files from '{}' to \n                           '{}'".format(workDir, appSrcDir))
    for name in glob.glob(str(workDir / 'mydesign.*')):
        print("    Copying: {}".format(name))
        shutil.copy2(name, str(appSrcDir))
    print("Step 3. Copying files from '{}' to \n                           '{}'".format(bertSWHuffmanDir, appSrcDir))
    for name in glob.glob(str(bertSWHuffmanDir / '*')):
        print("    Copying: {}".format(name))
        shutil.copy2(name, str(appSrcDir))
