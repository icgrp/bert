//
// Created by zhiyaot on 7/9/2020.
//
#ifndef BERT_GEN_FPGA_ERR_H
#define BERT_GEN_FPGA_ERR_H

#ifndef BUGDREE
#define ASSERT(condition, message, error)                                      \
    do                                                                         \
    {                                                                          \
        if (!(condition))                                                      \
        {                                                                      \
            std::cerr << "Assertion `" #condition "` failed in " << __FILE__   \
                      << " line " << __LINE__ << ": " << message << std::endl; \
            throw error;                                                       \
        }                                                                      \
    } while (false)
#else
#define ASSERT(condition, message) \
    do                             \
    {                              \
    } while (false)
#endif

enum class fpga_err
{
    NOT_STORED_LL,
    FILE_PTR_NULL,
    NO_SUCH_LL,
    EMPTY_FRAME_SET,
    NO_FRAME_FOUND,
    GENERIC
};

#include <ostream>

// TODO: Add support for windows colorful message here

namespace Color
{
    enum Code
    {
        RESET_ALL = 0,
        SET_BOLD = 1,
        SET_DIM = 2,
        SET_UNLINE = 3,
        SET_BLINK = 4,
        SET_INVERT = 5,
        SET_HIDDEN = 6,
        RESET_BOLD = 21,
        RESET_DIM = 22,
        RESET_UNLINE = 24,
        RESET_BLINK = 25,
        RESET_INVERT = 27,
        RESET_HIDDEN = 28,
        FG_DEFAULT = 39,
        FG_BLACK = 30,
        FG_RED = 31,
        FG_GREEN = 32,
        FG_YELLOW = 33,
        FG_BLUE = 34,
        FG_MAGENTA = 35,
        FG_CYAN = 36,
        FG_L_GRAY = 37,
        FG_D_GRAY = 90,
        FG_L_RED = 91,
        FG_L_GREEN = 92,
        FG_L_YELLOW = 93,
        FG_L_BLUE = 94,
        FG_L_MAGENTA = 95,
        FG_L_CYAN = 96,
        FG_WHITE = 97,
        BG_DEFAULT = 49,
        BG_BLACK = 40,
        BG_RED = 41,
        BG_GREEN = 42,
        BG_YELLOW = 43,
        BG_BLUE = 44,
        BG_MAGENTA = 45,
        BG_CYAN = 46,
        BG_L_GRAY = 47,
        BG_D_GRAY = 100,
        BG_L_RED = 101,
        BG_L_GREEN = 102,
        BG_L_YELLOW = 103,
        BG_L_BLUE = 104,
        BG_L_MAGENTA = 105,
        BG_L_CYAN = 106,
        BG_WHITE = 107
    };

    class Modifier
    {
        Code code;
    public:
        explicit Modifier(Code pCode) : code(pCode)
        {}

        friend std::ostream &operator<<(std::ostream &os, const Modifier &mod)
        {
            return os << "\033[" << mod.code << "m";
        }
    };
}

#endif //BERT_GEN_FPGA_ERR_H
