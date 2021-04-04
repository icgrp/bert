import os.path
import pathlib
import argparse
import glob
import shutil
import sys

# If following the tutorial verbatim, the project should be in a directory named huffman_demo.
prjName = "huffman_demo"

# If ran the same directory, the repo root directory is 3 levels up.
bertDir = "../../.."

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("workspaceDir", help='Directory which contains the SDK/Vitis workspace. The tutorial refers to this as WORK and is where provided files are copied to.  Example: /home/steven/myProject')
    args = parser.parse_args()

    bertDir = pathlib.Path(bertDir).resolve()
    assert os.path.isdir(str(bertDir)), "Cannot find BERT repo directory: " + str(bertDir) + "\n Run in same directory as script"
    # Check that all BERT subdirectories exist
    bertSrcDir = bertDir / "embedded" / "src" / "bert"
    assert os.path.isdir(str(bertSrcDir)), "Cannot find directory: " + str(bertSrcDir) + "\n Run in same directory as script"
    bertSWHuffmanDir = bertDir / "docs" / "tutorials" / "huffman" / "sw_huffman" 
    assert os.path.isdir(str(bertSWHuffmanDir)), "Cannot find directory: " + str(bertSWHuffmanDir)
    # Does not matter where we pull mydesign.c/h from (sdk vs vitis)
    bertHWHuffmanDir = bertDir / "docs" / "tutorials" / "huffman" / "hw_huffman_sdk" 
    assert os.path.isdir(str(bertSWHuffmanDir)), "Cannot find directory: " + str(bertHWHuffmanDir)

    
    # Check SDK directories exists
    workDir = pathlib.Path(args.workspaceDir).resolve()
    assert os.path.isdir(str(workDir)), "Cannot find workspace directory: " + args.workspaceDir
    # Double check for SDKWorkspace default directory created by SDK on Linux
    if not os.path.isdir(str(workDir / prjName)):
        for dir in workDir.iterdir():
            if dir.name == "SDKWorkspace":
                workDir = workDir / "SDKWorkspace"
                break
    appSrcDir = workDir / prjName / "src"
    assert os.path.isdir(str(appSrcDir)), "Cannot find project src directory: " + str(appSrcDir) + "\n Check project name. The project name can be adjust by editing the script."

    print("Step 1. Copying BERT lib files from '{}' to \n                           '{}'".format(bertSrcDir, appSrcDir))
    for name in glob.glob(str(bertSrcDir / '*')):
        if "7series" not in name:
            print("    Copying file: {}".format(name))
            shutil.copy2(name, str(appSrcDir))
    print("Step 2. Copying bert_gen C files from '{}' to \n                           '{}'".format(workDir, appSrcDir))
    for name in glob.glob(str(bertHWHuffmanDir / 'mydesign.*')):
        print("    Copying file: {}".format(name))
        shutil.copy2(name, str(appSrcDir))
    print("Step 3. Copying app files from '{}' to \n                           '{}'".format(bertSWHuffmanDir, appSrcDir))
    for name in glob.glob(str(bertSWHuffmanDir / '*')):
        print("    Copying file: {}".format(name))
        shutil.copy2(name, str(appSrcDir))
