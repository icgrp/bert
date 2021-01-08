#include <stdio.h>
#include <stdint.h>
#include "mydesign.h"
#define NUM_LOGICAL 12
int bert_compress_version=2; // ramb18 wes
const char *logical_names[] = {"genblk1[3].mem/ram","genblk1[2].mem/ram","genblk1[11].mem/ram","genblk1[4].mem/ram","genblk1[9].mem/ram","genblk1[10].mem/ram","genblk1[5].mem/ram","genblk1[0].mem/ram","genblk1[1].mem/ram","genblk1[7].mem/ram","genblk1[8].mem/ram","genblk1[6].mem/ram"};
// Beginning of Logical Memory 0
#define MEM0SEG0BITS_IN_FRAME0 128
int mem0seg0frame0bits[128]={720,852,732,864,744,876,756,888,780,912,792,924,804,936,816,948,726,858,738,870,750,882,762,894,786,918,798,930,810,942,822,954,723,855,735,867,747,879,759,891,783,915,795,927,807,939,819,951,729,861,741,873,753,885,765,897,789,921,801,933,813,945,825,957,722,854,734,866,746,878,758,890,782,914,794,926,806,938,818,950,728,860,740,872,752,884,764,896,788,920,800,932,812,944,824,956,725,857,737,869,749,881,761,893,785,917,797,929,809,941,821,953,731,863,743,875,755,887,767,899,791,923,803,935,815,947,827,959};
#define MEM0SEG0FRAME0 {MEM0SEG0BITS_IN_FRAME0,0x1000000,mem0seg0frame0bits}
//MEM0SEG0 repeat distance 128 covering 1 frames
#define MEM0SEG0FRAMES_IN_REPEAT 1
#define MEM0SEG0BITS_IN_REPEAT 128
#define MEM0SEG0SLOTS_IN_REPEAT 2
struct frame_bits mem0seg0frames[1]={MEM0SEG0FRAME0};
#define MEM0SEG0REPEATS 256
#define MEM0SEG0UNIQUE_FRAMES_IN_REPEAT 1
int mem0seg0unique_frames[1]= {0x1000000};
#define MEM0SEG0 {MEM0SEG0REPEATS,MEM0SEG0FRAMES_IN_REPEAT,MEM0SEG0BITS_IN_REPEAT,MEM0SEG0SLOTS_IN_REPEAT,MEM0SEG0UNIQUE_FRAMES_IN_REPEAT,mem0seg0frames,mem0seg0unique_frames}
#define MEM0SEGMENTS 1
struct segment_repeats mem0repeats[1]={MEM0SEG0};
#define MEM0FR0WEBITS (0xc0)
// End of Logical Memory 0
// Beginning of Logical Memory 1
#define MEM1SEG0BITS_IN_FRAME0 128
int mem1seg0frame0bits[128]={480,612,492,624,504,636,516,648,540,672,552,684,564,696,576,708,486,618,498,630,510,642,522,654,546,678,558,690,570,702,582,714,483,615,495,627,507,639,519,651,543,675,555,687,567,699,579,711,489,621,501,633,513,645,525,657,549,681,561,693,573,705,585,717,482,614,494,626,506,638,518,650,542,674,554,686,566,698,578,710,488,620,500,632,512,644,524,656,548,680,560,692,572,704,584,716,485,617,497,629,509,641,521,653,545,677,557,689,569,701,581,713,491,623,503,635,515,647,527,659,551,683,563,695,575,707,587,719};
#define MEM1SEG0FRAME0 {MEM1SEG0BITS_IN_FRAME0,0x1000000,mem1seg0frame0bits}
//MEM1SEG0 repeat distance 128 covering 1 frames
#define MEM1SEG0FRAMES_IN_REPEAT 1
#define MEM1SEG0BITS_IN_REPEAT 128
#define MEM1SEG0SLOTS_IN_REPEAT 2
struct frame_bits mem1seg0frames[1]={MEM1SEG0FRAME0};
#define MEM1SEG0REPEATS 256
#define MEM1SEG0UNIQUE_FRAMES_IN_REPEAT 1
int mem1seg0unique_frames[1]= {0x1000000};
#define MEM1SEG0 {MEM1SEG0REPEATS,MEM1SEG0FRAMES_IN_REPEAT,MEM1SEG0BITS_IN_REPEAT,MEM1SEG0SLOTS_IN_REPEAT,MEM1SEG0UNIQUE_FRAMES_IN_REPEAT,mem1seg0frames,mem1seg0unique_frames}
#define MEM1SEGMENTS 1
struct segment_repeats mem1repeats[1]={MEM1SEG0};
#define MEM1FR0WEBITS (0x30)
// End of Logical Memory 1
// Beginning of Logical Memory 2
#define MEM2SEG0BITS_IN_FRAME0 128
int mem2seg0frame0bits[128]={2736,2868,2748,2880,2760,2892,2772,2904,2796,2928,2808,2940,2820,2952,2832,2964,2742,2874,2754,2886,2766,2898,2778,2910,2802,2934,2814,2946,2826,2958,2838,2970,2739,2871,2751,2883,2763,2895,2775,2907,2799,2931,2811,2943,2823,2955,2835,2967,2745,2877,2757,2889,2769,2901,2781,2913,2805,2937,2817,2949,2829,2961,2841,2973,2738,2870,2750,2882,2762,2894,2774,2906,2798,2930,2810,2942,2822,2954,2834,2966,2744,2876,2756,2888,2768,2900,2780,2912,2804,2936,2816,2948,2828,2960,2840,2972,2741,2873,2753,2885,2765,2897,2777,2909,2801,2933,2813,2945,2825,2957,2837,2969,2747,2879,2759,2891,2771,2903,2783,2915,2807,2939,2819,2951,2831,2963,2843,2975};
#define MEM2SEG0FRAME0 {MEM2SEG0BITS_IN_FRAME0,0x1000000,mem2seg0frame0bits}
//MEM2SEG0 repeat distance 128 covering 1 frames
#define MEM2SEG0FRAMES_IN_REPEAT 1
#define MEM2SEG0BITS_IN_REPEAT 128
#define MEM2SEG0SLOTS_IN_REPEAT 2
struct frame_bits mem2seg0frames[1]={MEM2SEG0FRAME0};
#define MEM2SEG0REPEATS 256
#define MEM2SEG0UNIQUE_FRAMES_IN_REPEAT 1
int mem2seg0unique_frames[1]= {0x1000000};
#define MEM2SEG0 {MEM2SEG0REPEATS,MEM2SEG0FRAMES_IN_REPEAT,MEM2SEG0BITS_IN_REPEAT,MEM2SEG0SLOTS_IN_REPEAT,MEM2SEG0UNIQUE_FRAMES_IN_REPEAT,mem2seg0frames,mem2seg0unique_frames}
#define MEM2SEGMENTS 1
struct segment_repeats mem2repeats[1]={MEM2SEG0};
#define MEM2FR0WEBITS (0xc00000)
// End of Logical Memory 2
// Beginning of Logical Memory 3
#define MEM3SEG0BITS_IN_FRAME0 128
int mem3seg0frame0bits[128]={960,1092,972,1104,984,1116,996,1128,1020,1152,1032,1164,1044,1176,1056,1188,966,1098,978,1110,990,1122,1002,1134,1026,1158,1038,1170,1050,1182,1062,1194,963,1095,975,1107,987,1119,999,1131,1023,1155,1035,1167,1047,1179,1059,1191,969,1101,981,1113,993,1125,1005,1137,1029,1161,1041,1173,1053,1185,1065,1197,962,1094,974,1106,986,1118,998,1130,1022,1154,1034,1166,1046,1178,1058,1190,968,1100,980,1112,992,1124,1004,1136,1028,1160,1040,1172,1052,1184,1064,1196,965,1097,977,1109,989,1121,1001,1133,1025,1157,1037,1169,1049,1181,1061,1193,971,1103,983,1115,995,1127,1007,1139,1031,1163,1043,1175,1055,1187,1067,1199};
#define MEM3SEG0FRAME0 {MEM3SEG0BITS_IN_FRAME0,0x1000000,mem3seg0frame0bits}
//MEM3SEG0 repeat distance 128 covering 1 frames
#define MEM3SEG0FRAMES_IN_REPEAT 1
#define MEM3SEG0BITS_IN_REPEAT 128
#define MEM3SEG0SLOTS_IN_REPEAT 2
struct frame_bits mem3seg0frames[1]={MEM3SEG0FRAME0};
#define MEM3SEG0REPEATS 256
#define MEM3SEG0UNIQUE_FRAMES_IN_REPEAT 1
int mem3seg0unique_frames[1]= {0x1000000};
#define MEM3SEG0 {MEM3SEG0REPEATS,MEM3SEG0FRAMES_IN_REPEAT,MEM3SEG0BITS_IN_REPEAT,MEM3SEG0SLOTS_IN_REPEAT,MEM3SEG0UNIQUE_FRAMES_IN_REPEAT,mem3seg0frames,mem3seg0unique_frames}
#define MEM3SEGMENTS 1
struct segment_repeats mem3repeats[1]={MEM3SEG0};
#define MEM3FR0WEBITS (0x300)
// End of Logical Memory 3
// Beginning of Logical Memory 4
#define MEM4SEG0BITS_IN_FRAME0 128
int mem4seg0frame0bits[128]={2256,2388,2268,2400,2280,2412,2292,2424,2316,2448,2328,2460,2340,2472,2352,2484,2262,2394,2274,2406,2286,2418,2298,2430,2322,2454,2334,2466,2346,2478,2358,2490,2259,2391,2271,2403,2283,2415,2295,2427,2319,2451,2331,2463,2343,2475,2355,2487,2265,2397,2277,2409,2289,2421,2301,2433,2325,2457,2337,2469,2349,2481,2361,2493,2258,2390,2270,2402,2282,2414,2294,2426,2318,2450,2330,2462,2342,2474,2354,2486,2264,2396,2276,2408,2288,2420,2300,2432,2324,2456,2336,2468,2348,2480,2360,2492,2261,2393,2273,2405,2285,2417,2297,2429,2321,2453,2333,2465,2345,2477,2357,2489,2267,2399,2279,2411,2291,2423,2303,2435,2327,2459,2339,2471,2351,2483,2363,2495};
#define MEM4SEG0FRAME0 {MEM4SEG0BITS_IN_FRAME0,0x1000000,mem4seg0frame0bits}
//MEM4SEG0 repeat distance 128 covering 1 frames
#define MEM4SEG0FRAMES_IN_REPEAT 1
#define MEM4SEG0BITS_IN_REPEAT 128
#define MEM4SEG0SLOTS_IN_REPEAT 2
struct frame_bits mem4seg0frames[1]={MEM4SEG0FRAME0};
#define MEM4SEG0REPEATS 256
#define MEM4SEG0UNIQUE_FRAMES_IN_REPEAT 1
int mem4seg0unique_frames[1]= {0x1000000};
#define MEM4SEG0 {MEM4SEG0REPEATS,MEM4SEG0FRAMES_IN_REPEAT,MEM4SEG0BITS_IN_REPEAT,MEM4SEG0SLOTS_IN_REPEAT,MEM4SEG0UNIQUE_FRAMES_IN_REPEAT,mem4seg0frames,mem4seg0unique_frames}
#define MEM4SEGMENTS 1
struct segment_repeats mem4repeats[1]={MEM4SEG0};
#define MEM4FR0WEBITS (0xc0000)
// End of Logical Memory 4
// Beginning of Logical Memory 5
#define MEM5SEG0BITS_IN_FRAME0 128
int mem5seg0frame0bits[128]={2496,2628,2508,2640,2520,2652,2532,2664,2556,2688,2568,2700,2580,2712,2592,2724,2502,2634,2514,2646,2526,2658,2538,2670,2562,2694,2574,2706,2586,2718,2598,2730,2499,2631,2511,2643,2523,2655,2535,2667,2559,2691,2571,2703,2583,2715,2595,2727,2505,2637,2517,2649,2529,2661,2541,2673,2565,2697,2577,2709,2589,2721,2601,2733,2498,2630,2510,2642,2522,2654,2534,2666,2558,2690,2570,2702,2582,2714,2594,2726,2504,2636,2516,2648,2528,2660,2540,2672,2564,2696,2576,2708,2588,2720,2600,2732,2501,2633,2513,2645,2525,2657,2537,2669,2561,2693,2573,2705,2585,2717,2597,2729,2507,2639,2519,2651,2531,2663,2543,2675,2567,2699,2579,2711,2591,2723,2603,2735};
#define MEM5SEG0FRAME0 {MEM5SEG0BITS_IN_FRAME0,0x1000000,mem5seg0frame0bits}
//MEM5SEG0 repeat distance 128 covering 1 frames
#define MEM5SEG0FRAMES_IN_REPEAT 1
#define MEM5SEG0BITS_IN_REPEAT 128
#define MEM5SEG0SLOTS_IN_REPEAT 2
struct frame_bits mem5seg0frames[1]={MEM5SEG0FRAME0};
#define MEM5SEG0REPEATS 256
#define MEM5SEG0UNIQUE_FRAMES_IN_REPEAT 1
int mem5seg0unique_frames[1]= {0x1000000};
#define MEM5SEG0 {MEM5SEG0REPEATS,MEM5SEG0FRAMES_IN_REPEAT,MEM5SEG0BITS_IN_REPEAT,MEM5SEG0SLOTS_IN_REPEAT,MEM5SEG0UNIQUE_FRAMES_IN_REPEAT,mem5seg0frames,mem5seg0unique_frames}
#define MEM5SEGMENTS 1
struct segment_repeats mem5repeats[1]={MEM5SEG0};
#define MEM5FR0WEBITS (0x300000)
// End of Logical Memory 5
// Beginning of Logical Memory 6
#define MEM6SEG0BITS_IN_FRAME0 128
int mem6seg0frame0bits[128]={1200,1332,1212,1344,1224,1356,1236,1368,1260,1392,1272,1404,1284,1416,1296,1428,1206,1338,1218,1350,1230,1362,1242,1374,1266,1398,1278,1410,1290,1422,1302,1434,1203,1335,1215,1347,1227,1359,1239,1371,1263,1395,1275,1407,1287,1419,1299,1431,1209,1341,1221,1353,1233,1365,1245,1377,1269,1401,1281,1413,1293,1425,1305,1437,1202,1334,1214,1346,1226,1358,1238,1370,1262,1394,1274,1406,1286,1418,1298,1430,1208,1340,1220,1352,1232,1364,1244,1376,1268,1400,1280,1412,1292,1424,1304,1436,1205,1337,1217,1349,1229,1361,1241,1373,1265,1397,1277,1409,1289,1421,1301,1433,1211,1343,1223,1355,1235,1367,1247,1379,1271,1403,1283,1415,1295,1427,1307,1439};
#define MEM6SEG0FRAME0 {MEM6SEG0BITS_IN_FRAME0,0x1000000,mem6seg0frame0bits}
//MEM6SEG0 repeat distance 128 covering 1 frames
#define MEM6SEG0FRAMES_IN_REPEAT 1
#define MEM6SEG0BITS_IN_REPEAT 128
#define MEM6SEG0SLOTS_IN_REPEAT 2
struct frame_bits mem6seg0frames[1]={MEM6SEG0FRAME0};
#define MEM6SEG0REPEATS 256
#define MEM6SEG0UNIQUE_FRAMES_IN_REPEAT 1
int mem6seg0unique_frames[1]= {0x1000000};
#define MEM6SEG0 {MEM6SEG0REPEATS,MEM6SEG0FRAMES_IN_REPEAT,MEM6SEG0BITS_IN_REPEAT,MEM6SEG0SLOTS_IN_REPEAT,MEM6SEG0UNIQUE_FRAMES_IN_REPEAT,mem6seg0frames,mem6seg0unique_frames}
#define MEM6SEGMENTS 1
struct segment_repeats mem6repeats[1]={MEM6SEG0};
#define MEM6FR0WEBITS (0xc00)
// End of Logical Memory 6
// Beginning of Logical Memory 7
#define MEM7SEG0BITS_IN_FRAME0 128
int mem7seg0frame0bits[128]={0,132,12,144,24,156,36,168,60,192,72,204,84,216,96,228,6,138,18,150,30,162,42,174,66,198,78,210,90,222,102,234,3,135,15,147,27,159,39,171,63,195,75,207,87,219,99,231,9,141,21,153,33,165,45,177,69,201,81,213,93,225,105,237,2,134,14,146,26,158,38,170,62,194,74,206,86,218,98,230,8,140,20,152,32,164,44,176,68,200,80,212,92,224,104,236,5,137,17,149,29,161,41,173,65,197,77,209,89,221,101,233,11,143,23,155,35,167,47,179,71,203,83,215,95,227,107,239};
#define MEM7SEG0FRAME0 {MEM7SEG0BITS_IN_FRAME0,0x1000000,mem7seg0frame0bits}
//MEM7SEG0 repeat distance 128 covering 1 frames
#define MEM7SEG0FRAMES_IN_REPEAT 1
#define MEM7SEG0BITS_IN_REPEAT 128
#define MEM7SEG0SLOTS_IN_REPEAT 2
struct frame_bits mem7seg0frames[1]={MEM7SEG0FRAME0};
#define MEM7SEG0REPEATS 256
#define MEM7SEG0UNIQUE_FRAMES_IN_REPEAT 1
int mem7seg0unique_frames[1]= {0x1000000};
#define MEM7SEG0 {MEM7SEG0REPEATS,MEM7SEG0FRAMES_IN_REPEAT,MEM7SEG0BITS_IN_REPEAT,MEM7SEG0SLOTS_IN_REPEAT,MEM7SEG0UNIQUE_FRAMES_IN_REPEAT,mem7seg0frames,mem7seg0unique_frames}
#define MEM7SEGMENTS 1
struct segment_repeats mem7repeats[1]={MEM7SEG0};
#define MEM7FR0WEBITS (0x3)
// End of Logical Memory 7
// Beginning of Logical Memory 8
#define MEM8SEG0BITS_IN_FRAME0 128
int mem8seg0frame0bits[128]={240,372,252,384,264,396,276,408,300,432,312,444,324,456,336,468,246,378,258,390,270,402,282,414,306,438,318,450,330,462,342,474,243,375,255,387,267,399,279,411,303,435,315,447,327,459,339,471,249,381,261,393,273,405,285,417,309,441,321,453,333,465,345,477,242,374,254,386,266,398,278,410,302,434,314,446,326,458,338,470,248,380,260,392,272,404,284,416,308,440,320,452,332,464,344,476,245,377,257,389,269,401,281,413,305,437,317,449,329,461,341,473,251,383,263,395,275,407,287,419,311,443,323,455,335,467,347,479};
#define MEM8SEG0FRAME0 {MEM8SEG0BITS_IN_FRAME0,0x1000000,mem8seg0frame0bits}
//MEM8SEG0 repeat distance 128 covering 1 frames
#define MEM8SEG0FRAMES_IN_REPEAT 1
#define MEM8SEG0BITS_IN_REPEAT 128
#define MEM8SEG0SLOTS_IN_REPEAT 2
struct frame_bits mem8seg0frames[1]={MEM8SEG0FRAME0};
#define MEM8SEG0REPEATS 256
#define MEM8SEG0UNIQUE_FRAMES_IN_REPEAT 1
int mem8seg0unique_frames[1]= {0x1000000};
#define MEM8SEG0 {MEM8SEG0REPEATS,MEM8SEG0FRAMES_IN_REPEAT,MEM8SEG0BITS_IN_REPEAT,MEM8SEG0SLOTS_IN_REPEAT,MEM8SEG0UNIQUE_FRAMES_IN_REPEAT,mem8seg0frames,mem8seg0unique_frames}
#define MEM8SEGMENTS 1
struct segment_repeats mem8repeats[1]={MEM8SEG0};
#define MEM8FR0WEBITS (0xc)
// End of Logical Memory 8
// Beginning of Logical Memory 9
#define MEM9SEG0BITS_IN_FRAME0 128
int mem9seg0frame0bits[128]={1776,1908,1788,1920,1800,1932,1812,1944,1836,1968,1848,1980,1860,1992,1872,2004,1782,1914,1794,1926,1806,1938,1818,1950,1842,1974,1854,1986,1866,1998,1878,2010,1779,1911,1791,1923,1803,1935,1815,1947,1839,1971,1851,1983,1863,1995,1875,2007,1785,1917,1797,1929,1809,1941,1821,1953,1845,1977,1857,1989,1869,2001,1881,2013,1778,1910,1790,1922,1802,1934,1814,1946,1838,1970,1850,1982,1862,1994,1874,2006,1784,1916,1796,1928,1808,1940,1820,1952,1844,1976,1856,1988,1868,2000,1880,2012,1781,1913,1793,1925,1805,1937,1817,1949,1841,1973,1853,1985,1865,1997,1877,2009,1787,1919,1799,1931,1811,1943,1823,1955,1847,1979,1859,1991,1871,2003,1883,2015};
#define MEM9SEG0FRAME0 {MEM9SEG0BITS_IN_FRAME0,0x1000000,mem9seg0frame0bits}
//MEM9SEG0 repeat distance 128 covering 1 frames
#define MEM9SEG0FRAMES_IN_REPEAT 1
#define MEM9SEG0BITS_IN_REPEAT 128
#define MEM9SEG0SLOTS_IN_REPEAT 2
struct frame_bits mem9seg0frames[1]={MEM9SEG0FRAME0};
#define MEM9SEG0REPEATS 256
#define MEM9SEG0UNIQUE_FRAMES_IN_REPEAT 1
int mem9seg0unique_frames[1]= {0x1000000};
#define MEM9SEG0 {MEM9SEG0REPEATS,MEM9SEG0FRAMES_IN_REPEAT,MEM9SEG0BITS_IN_REPEAT,MEM9SEG0SLOTS_IN_REPEAT,MEM9SEG0UNIQUE_FRAMES_IN_REPEAT,mem9seg0frames,mem9seg0unique_frames}
#define MEM9SEGMENTS 1
struct segment_repeats mem9repeats[1]={MEM9SEG0};
#define MEM9FR0WEBITS (0xc000)
// End of Logical Memory 9
// Beginning of Logical Memory 10
#define MEM10SEG0BITS_IN_FRAME0 128
int mem10seg0frame0bits[128]={2016,2148,2028,2160,2040,2172,2052,2184,2076,2208,2088,2220,2100,2232,2112,2244,2022,2154,2034,2166,2046,2178,2058,2190,2082,2214,2094,2226,2106,2238,2118,2250,2019,2151,2031,2163,2043,2175,2055,2187,2079,2211,2091,2223,2103,2235,2115,2247,2025,2157,2037,2169,2049,2181,2061,2193,2085,2217,2097,2229,2109,2241,2121,2253,2018,2150,2030,2162,2042,2174,2054,2186,2078,2210,2090,2222,2102,2234,2114,2246,2024,2156,2036,2168,2048,2180,2060,2192,2084,2216,2096,2228,2108,2240,2120,2252,2021,2153,2033,2165,2045,2177,2057,2189,2081,2213,2093,2225,2105,2237,2117,2249,2027,2159,2039,2171,2051,2183,2063,2195,2087,2219,2099,2231,2111,2243,2123,2255};
#define MEM10SEG0FRAME0 {MEM10SEG0BITS_IN_FRAME0,0x1000000,mem10seg0frame0bits}
//MEM10SEG0 repeat distance 128 covering 1 frames
#define MEM10SEG0FRAMES_IN_REPEAT 1
#define MEM10SEG0BITS_IN_REPEAT 128
#define MEM10SEG0SLOTS_IN_REPEAT 2
struct frame_bits mem10seg0frames[1]={MEM10SEG0FRAME0};
#define MEM10SEG0REPEATS 256
#define MEM10SEG0UNIQUE_FRAMES_IN_REPEAT 1
int mem10seg0unique_frames[1]= {0x1000000};
#define MEM10SEG0 {MEM10SEG0REPEATS,MEM10SEG0FRAMES_IN_REPEAT,MEM10SEG0BITS_IN_REPEAT,MEM10SEG0SLOTS_IN_REPEAT,MEM10SEG0UNIQUE_FRAMES_IN_REPEAT,mem10seg0frames,mem10seg0unique_frames}
#define MEM10SEGMENTS 1
struct segment_repeats mem10repeats[1]={MEM10SEG0};
#define MEM10FR0WEBITS (0x30000)
// End of Logical Memory 10
// Beginning of Logical Memory 11
#define MEM11SEG0BITS_IN_FRAME0 128
int mem11seg0frame0bits[128]={1536,1668,1548,1680,1560,1692,1572,1704,1596,1728,1608,1740,1620,1752,1632,1764,1542,1674,1554,1686,1566,1698,1578,1710,1602,1734,1614,1746,1626,1758,1638,1770,1539,1671,1551,1683,1563,1695,1575,1707,1599,1731,1611,1743,1623,1755,1635,1767,1545,1677,1557,1689,1569,1701,1581,1713,1605,1737,1617,1749,1629,1761,1641,1773,1538,1670,1550,1682,1562,1694,1574,1706,1598,1730,1610,1742,1622,1754,1634,1766,1544,1676,1556,1688,1568,1700,1580,1712,1604,1736,1616,1748,1628,1760,1640,1772,1541,1673,1553,1685,1565,1697,1577,1709,1601,1733,1613,1745,1625,1757,1637,1769,1547,1679,1559,1691,1571,1703,1583,1715,1607,1739,1619,1751,1631,1763,1643,1775};
#define MEM11SEG0FRAME0 {MEM11SEG0BITS_IN_FRAME0,0x1000000,mem11seg0frame0bits}
//MEM11SEG0 repeat distance 128 covering 1 frames
#define MEM11SEG0FRAMES_IN_REPEAT 1
#define MEM11SEG0BITS_IN_REPEAT 128
#define MEM11SEG0SLOTS_IN_REPEAT 2
struct frame_bits mem11seg0frames[1]={MEM11SEG0FRAME0};
#define MEM11SEG0REPEATS 256
#define MEM11SEG0UNIQUE_FRAMES_IN_REPEAT 1
int mem11seg0unique_frames[1]= {0x1000000};
#define MEM11SEG0 {MEM11SEG0REPEATS,MEM11SEG0FRAMES_IN_REPEAT,MEM11SEG0BITS_IN_REPEAT,MEM11SEG0SLOTS_IN_REPEAT,MEM11SEG0UNIQUE_FRAMES_IN_REPEAT,mem11seg0frames,mem11seg0unique_frames}
#define MEM11SEGMENTS 1
struct segment_repeats mem11repeats[1]={MEM11SEG0};
#define MEM11FR0WEBITS (0x3000)
// End of Logical Memory 11
struct frame_range mem0_frame_ranges[1] = {{0x1000000,256,MEM0FR0WEBITS,0} };
struct frame_range mem1_frame_ranges[1] = {{0x1000000,256,MEM1FR0WEBITS,0} };
struct frame_range mem2_frame_ranges[1] = {{0x1000000,256,MEM2FR0WEBITS,0} };
struct frame_range mem3_frame_ranges[1] = {{0x1000000,256,MEM3FR0WEBITS,0} };
struct frame_range mem4_frame_ranges[1] = {{0x1000000,256,MEM4FR0WEBITS,0} };
struct frame_range mem5_frame_ranges[1] = {{0x1000000,256,MEM5FR0WEBITS,0} };
struct frame_range mem6_frame_ranges[1] = {{0x1000000,256,MEM6FR0WEBITS,0} };
struct frame_range mem7_frame_ranges[1] = {{0x1000000,256,MEM7FR0WEBITS,0} };
struct frame_range mem8_frame_ranges[1] = {{0x1000000,256,MEM8FR0WEBITS,0} };
struct frame_range mem9_frame_ranges[1] = {{0x1000000,256,MEM9FR0WEBITS,0} };
struct frame_range mem10_frame_ranges[1] = {{0x1000000,256,MEM10FR0WEBITS,0} };
struct frame_range mem11_frame_ranges[1] = {{0x1000000,256,MEM11FR0WEBITS,0} };
struct logical_memory logical_memories[NUM_LOGICAL] ={
        {1,64,512,MEM0SEGMENTS,mem0_frame_ranges,mem0repeats}
,       {1,64,512,MEM1SEGMENTS,mem1_frame_ranges,mem1repeats}
,       {1,64,512,MEM2SEGMENTS,mem2_frame_ranges,mem2repeats}
,       {1,64,512,MEM3SEGMENTS,mem3_frame_ranges,mem3repeats}
,       {1,64,512,MEM4SEGMENTS,mem4_frame_ranges,mem4repeats}
,       {1,64,512,MEM5SEGMENTS,mem5_frame_ranges,mem5repeats}
,       {1,64,512,MEM6SEGMENTS,mem6_frame_ranges,mem6repeats}
,       {1,64,512,MEM7SEGMENTS,mem7_frame_ranges,mem7repeats}
,       {1,64,512,MEM8SEGMENTS,mem8_frame_ranges,mem8repeats}
,       {1,64,512,MEM9SEGMENTS,mem9_frame_ranges,mem9repeats}
,       {1,64,512,MEM10SEGMENTS,mem10_frame_ranges,mem10repeats}
,       {1,64,512,MEM11SEGMENTS,mem11_frame_ranges,mem11repeats}
};
