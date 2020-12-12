cmake_minimum_required(VERSION 3.3)
project(bert_gen)

set(CMAKE_CXX_STANDARD 17)

add_executable(bert_gen bert_gen.cpp include/fpga_type.h
        include/fpga_helper.h src/fpga_helper.cpp include/fpga_err.h include/fpga_gen.h src/fpga_gen.cpp include/fpga_parse.h src/fpga_parse.cpp)
