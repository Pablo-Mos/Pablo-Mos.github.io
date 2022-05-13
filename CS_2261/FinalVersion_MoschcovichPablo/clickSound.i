# 1 "clickSound.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "clickSound.c"


const unsigned int clickSound_sampleRate = 11025;
const unsigned int clickSound_length = 3584;

const signed char clickSound_data[] = {
0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, 0, -1, 0, 0, 0, 0,
0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, -1, 0, -1, 0, -1, 0, 0, 0,
-1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0,
-1, 0, -1, 0, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0,
-1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0,
0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1,
0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, 0, 0, -1,
0, -1, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, -1, 0, 0, -1, 0,
-1, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, -1, -1, 0, -1, 0,
-1, 0, -1, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0,
-1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, -1, 0, 0,
0, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1, 0, -1, -1, -1, 0, 0, 0, -1, -1,
-1, 0, 0, 0, 0, 0, -1, -1, -1, -1, 0, 0, 0, -1, 0, -2, 1, 11, 21, 28,
23, 7, -18, -43, -56, -49, -23, 16, 52, 70, 64, 35, -6, -45, -69, -69, -46, -7, 33, 62,
69, 51, 16, -25, -58, -71, -60, -30, 10, 46, 66, 63, 38, 0, -39, -65, -68, -48, -12, 27,
58, 68, 55, 23, -17, -52, -68, -62, -34, 5, 42, 64, 64, 41, 4, -35, -62, -68, -51, -17,
22, 53, 66, 56, 26, -12, -47, -66, -62, -37, 0, 37, 62, 64, 45, 10, -28, -57, -67, -53,
-22, 17, 49, 65, 57, 30, -8, -43, -64, -63, -42, -6, 31, 57, 63, 48, 16, -22, -52, -64,
-54, -26, 11, 45, 62, 58, 35, -1, -36, -59, -62, -44, -12, 25, 53, 62, 50, 21, -16, -47,
-63, -57, -32, 3, 37, 58, 59, 39, 6, -29, -54, -61, -47, -17, 19, 48, 61, 52, 25, -10,
-42, -60, -57, -35, -1, 33, 55, 58, 42, 10, -25, -51, -60, -49, -22, 13, 43, 58, 53, 30,
-3, -36, -56, -57, -39, -7, 26, 51, 57, 45, 17, -17, -45, -58, -51, -27, 6, 37, 54, 53,
34, 3, -30, -52, -56, -42, -14, 19, 45, 56, 47, 23, -10, -39, -55, -52, -32, 0, 31, 52,
54, 38, 9, -24, -48, -56, -45, -19, 14, 42, 55, 49, 26, -6, -36, -54, -54, -35, -5, 27,
49, 55, 42, 14, -18, -44, -55, -47, -23, 9, 37, 53, 50, 30, 0, -30, -51, -54, -39, -10,
21, 45, 53, 43, 18, -14, -40, -53, -48, -26, 4, 33, 50, 50, 33, 4, -26, -47, -52, -39,
-13, 18, 42, 52, 43, 20, -10, -37, -51, -48, -29, -1, 28, 47, 49, 35, 8, -21, -44, -51,
-41, -17, 12, 37, 49, 45, 25, -3, -31, -47, -48, -32, -6, 23, 43, 48, 37, 12, -16, -39,
-49, -42, -21, 7, 32, 46, 44, 27, 0, -27, -44, -47, -34, -9, 18, 39, 47, 39, 17, -10,
-34, -46, -43, -25, 2, 27, 43, 44, 29, 5, -22, -41, -46, -36, -14, 13, 35, 45, 39, 20,
-7, -31, -45, -43, -27, -2, 24, 41, 45, 33, 10, -16, -37, -46, -39, -18, 8, 31, 44, 41,
24, -2, -27, -43, -45, -32, -9, 18, 37, 44, 35, 14, -12, -34, -45, -40, -22, 4, 28, 42,
42, 27, 3, -23, -40, -45, -34, -11, 15, 36, 44, 37, 16, -9, -32, -44, -42, -25, 0, 24,
40, 42, 29, 6, -19, -38, -44, -35, -14, 11, 33, 43, 38, 20, -5, -28, -42, -41, -26, -3,
21, 38, 41, 30, 9, -16, -36, -43, -37, -18, 7, 28, 40, 38, 23, -1, -24, -39, -41, -29,
-7, 17, 35, 41, 33, 14, -11, -31, -42, -38, -21, 3, 26, 39, 39, 25, 2, -21, -38, -42,
-32, -12, 13, 32, 41, 35, 17, -7, -29, -41, -38, -23, 0, 23, 38, 40, 28, 6, -18, -35,
-41, -33, -13, 11, 31, 40, 35, 18, -6, -27, -40, -39, -25, -3, 20, 35, 39, 28, 8, -15,
-33, -40, -33, -15, 8, 28, 39, 36, 20, -2, -24, -38, -39, -26, -5, 18, 34, 39, 30, 10,
-13, -32, -40, -35, -19, 4, 25, 37, 36, 23, 2, -20, -35, -38, -28, -8, 14, 31, 38, 31,
14, -8, -28, -38, -35, -20, 2, 23, 35, 36, 23, 3, -19, -34, -38, -29, -11, 11, 29, 36,
32, 16, -5, -25, -36, -34, -21, -1, 20, 33, 35, 25, 6, -15, -31, -36, -30, -13, 8, 26,
35, 31, 17, -4, -23, -35, -35, -23, -4, 16, 31, 35, 26, 9, -12, -28, -35, -30, -14, 6,
23, 33, 31, 19, 0, -19, -31, -33, -23, -6, 13, 28, 32, 25, 9, -10, -25, -32, -29, -15,
3, 20, 30, 29, 18, 2, -16, -28, -30, -23, -7, 10, 24, 29, 25, 12, -5, -20, -29, -27,
-17, -1, 15, 25, 27, 19, 5, -12, -24, -29, -23, -10, 6, 20, 27, 25, 14, -2, -18, -27,
-28, -19, -3, 13, 25, 28, 21, 7, -10, -23, -28, -24, -12, 4, 18, 26, 24, 14, -1, -16,
-26, -27, -19, -4, 11, 22, 26, 21, 8, -7, -21, -27, -24, -13, 2, 17, 25, 25, 16, 1,
-14, -24, -27, -20, -7, 9, 21, 25, 21, 9, -6, -19, -26, -25, -15, 0, 14, 24, 25, 17,
4, -11, -22, -25, -20, -8, 6, 19, 24, 21, 11, -4, -16, -24, -23, -15, -2, 11, 21, 22,
16, 5, -9, -20, -24, -20, -10, 4, 17, 23, 21, 12, -1, -15, -23, -24, -16, -3, 11, 21,
23, 18, 6, -8, -19, -24, -21, -12, 1, 13, 21, 22, 14, 1, -13, -21, -22, -16, -5, 7,
17, 21, 19, 9, -4, -17, -23, -20, -10, 1, 10, 17, 20, 15, 5, -1, -6, -23, -36, -21,
20, 44, 22, -23, -32, 8, 43, 16, -48, -65, -9, 56, 55, -6, -51, -25, 34, 45, -8, -60,
-43, 25, 63, 26, -38, -49, 3, 50, 30, -34, -62, -16, 48, 53, -6, -53, -30, 31, 51, 3,
-54, -48, 14, 58, 31, -32, -52, -4, 49, 39, -24, -60, -23, 42, 55, 0, -53, -39, 23, 55,
16, -45, -51, 5, 54, 35, -27, -54, -12, 45, 44, -14, -57, -30, 33, 54, 8, -47, -42, 16,
53, 23, -38, -52, -2, 50, 39, -22, -55, -20, 39, 49, -3, -52, -36, 25, 53, 14, -43, -47,
9, 53, 30, -33, -55, -10, 47, 45, -13, -54, -27, 33, 51, 4, -48, -41, 18, 54, 21, -38,
-50, 0, 51, 37, -24, -55, -18, 41, 48, -6, -53, -34, 27, 54, 12, -45, -47, 9, 53, 30,
-30, -52, -9, 45, 41, -15, -53, -25, 34, 50, 3, -49, -39, 18, 53, 22, -37, -49, 0, 48,
35, -23, -52, -16, 40, 44, -8, -50, -30, 26, 49, 11, -41, -42, 9, 48, 25, -30, -47, -6,
42, 37, -16, -48, -21, 31, 44, 2, -42, -34, 15, 45, 17, -33, -42, 1, 43, 30, -21, -46,
-13, 35, 39, -7, -44, -26, 24, 42, 6, -39, -35, 12, 44, 19, -31, -42, -1, 41, 32, -16,
-44, -18, 29, 39, -1, -40, -29, 17, 41, 12, -33, -37, 5, 40, 25, -21, -41, -9, 33, 32,
-10, -40, -21, 24, 37, 3, -36, -30, 13, 39, 16, -27, -36, -1, 35, 26, -17, -39, -12, 29,
33, -6, -38, -23, 20, 38, 7, -33, -32, 8, 37, 18, -25, -37, -3, 34, 27, -15, -38, -14,
27, 34, -1, -36, -26, 15, 36, 11, -30, -33, 4, 36, 21, -21, -37, -7, 31, 30, -9, -37,
-20, 22, 35, 3, -34, -29, 11, 36, 15, -26, -35, -1, 33, 25, -15, -37, -13, 26, 32, -4,
-36, -24, 18, 37, 8, -31, -32, 7, 36, 20, -22, -36, -7, 30, 28, -10, -37, -18, 23, 34,
1, -33, -26, 13, 35, 12, -26, -32, 1, 32, 22, -17, -35, -10, 28, 30, -6, -35, -21, 19,
34, 6, -30, -30, 7, 34, 17, -22, -34, -4, 30, 26, -12, -35, -15, 23, 31, 0, -32, -25,
12, 33, 11, -25, -30, 2, 31, 20, -17, -33, -8, 26, 27, -6, -32, -19, 17, 30, 5, -27,
-25, 8, 30, 14, -20, -30, -2, 27, 22, -12, -31, -12, 21, 27, -2, -30, -21, 14, 30, 8,
-25, -27, 4, 30, 17, -18, -32, -7, 25, 25, -7, -30, -16, 18, 29, 2, -28, -23, 10, 30,
12, -22, -29, 0, 27, 20, -13, -30, -9, 23, 25, -4, -29, -18, 15, 29, 5, -25, -25, 5,
27, 15, -17, -28, -4, 24, 21, -9, -28, -13, 19, 26, 0, -26, -20, 10, 27, 9, -21, -25,
2, 26, 17, -14, -28, -6, 22, 22, -6, -28, -16, 15, 25, 4, -23, -21, 7, 26, 11, -18,
-25, -1, 24, 18, -11, -26, -10, 18, 22, -2, -24, -16, 11, 24, 6, -20, -21, 4, 24, 13,
-15, -25, -4, 21, 19, -7, -25, -11, 16, 23, 0, -23, -18, 10, 24, 8, -19, -23, 1, 22,
15, -11, -23, -6, 18, 19, -4, -23, -13, 13, 22, 3, -20, -19, 6, 22, 11, -15, -22, -2,
20, 16, -9, -23, -8, 16, 20, -2, -22, -15, 10, 22, 6, -17, -19, 3, 21, 11, -13, -21,
-3, 18, 16, -7, -22, -10, 14, 19, 0, -19, -15, 8, 20, 6, -16, -18, 2, 19, 12, -11,
-20, -5, 16, 17, -4, -19, -11, 10, 18, 3, -17, -16, 5, 19, 9, -13, -19, -2, 17, 15,
-6, -19, -8, 12, 17, -1, -18, -13, 8, 19, 5, -16, -17, 2, 19, 11, -11, -20, -4, 16,
15, -5, -20, -10, 12, 18, 1, -18, -15, 6, 19, 8, -13, -18, 0, 17, 12, -9, -19, -6,
14, 16, -3, -19, -11, 9, 18, 3, -16, -15, 3, 17, 8, -12, -18, -2, 16, 13, -7, -19,
-8, 12, 17, 0, -16, -13, 6, 17, 5, -14, -16, 1, 16, 10, -10, -18, -4, 14, 14, -4,
-17, -9, 10, 16, 1, -16, -14, 5, 16, 6, -12, -16, 0, 15, 12, -7, -17, -6, 11, 14,
-2, -16, -11, 8, 16, 3, -14, -14, 3, 16, 8, -10, -16, -3, 13, 12, -6, -17, -7, 10,
14, 0, -15, -12, 6, 15, 5, -12, -14, 1, 14, 9, -9, -16, -4, 12, 12, -4, -16, -8,
9, 14, 2, -13, -12, 4, 14, 6, -10, -14, -1, 13, 10, -6, -15, -5, 10, 12, -2, -14,
-10, 6, 13, 3, -12, -12, 2, 13, 7, -9, -14, -2, 12, 10, -5, -14, -7, 8, 12, 0,
-13, -10, 5, 13, 4, -11, -13, 1, 13, 8, -7, -14, -4, 10, 10, -3, -13, -8, 7, 12,
1, -12, -11, 3, 12, 5, -9, -13, -1, 11, 9, -5, -13, -5, 9, 11, -1, -13, -9, 6,
12, 3, -10, -11, 1, 11, 6, -7, -12, -2, 10, 9, -4, -13, -6, 7, 11, 0, -11, -10,
3, 11, 4, -9, -11, 0, 10, 7, -6, -12, -3, 8, 9, -2, -11, -7, 5, 10, 1, -10,
-9, 3, 11, 5, -8, -11, -1, 10, 7, -5, -11, -5, 7, 9, -1, -11, -7, 5, 10, 2,
-9, -9, 2, 10, 5, -7, -11, -2, 8, 7, -4, -11, -5, 7, 9, 0, -10, -8, 4, 10,
3, -8, -10, 0, 9, 6, -5, -11, -3, 8, 8, -2, -10, -6, 6, 9, 1, -9, -9, 2,
9, 4, -7, -10, -1, 9, 7, -4, -10, -4, 7, 9, -1, -10, -7, 4, 9, 2, -8, -8,
1, 9, 5, -5, -9, -2, 7, 7, -3, -9, -5, 5, 7, 0, -8, -6, 3, 8, 2, -6,
-8, 0, 7, 4, -4, -8, -3, 5, 6, -1, -7, -4, 3, 6, 1, -6, -6, 1, 6, 3,
-5, -7, -1, 5, 4, -2, -6, -3, 4, 5, -1, -6, -4, 2, 5, 1, -5, -5, 0, 5,
3, -3, -5, -2, 4, 4, -1, -5, -3, 3, 4, 0, -5, -4, 1, 4, 2, -3, -5, -1,
4, 3, -2, -5, -2, 3, 3, -1, -4, -3, 1, 4, 1, -3, -4, 0, 3, 1, -3, -4,
-1, 3, 2, -2, -4, -2, 2, 3, 0, -3, -3, 1, 3, 1, -3, -3, 0, 3, 1, -2,
-4, -1, 2, 2, -1, -3, -2, 1, 2, 0, -3, -3, 1, 2, 0, -3, -3, 0, 2, 1,
-2, -3, -1, 1, 2, -1, -3, -2, 1, 2, 0, -3, -2, 0, 2, 1, -2, -2, -1, 1,
1, -1, -3, -1, 1, 1, -1, -3, -2, 0, 2, 0, -2, -2, 0, 1, 1, -2, -2, -1,
1, 1, -1, -2, -1, 1, 1, 0, -2, -2, 0, 1, 0, -2, -2, 0, 1, 1, -1, -2,
-1, 1, 1, -1, -2, -1, 0, 1, 0, -2, -2, 0, 1, 0, -1, -2, -1, 1, 1, -1,
-2, -1, 0, 1, -1, -2, -1, 0, 1, 0, -2, -2, 0, 1, 0, -1, -2, -1, 0, 0,
-1, -2, -1, 0, 1, 0, -2, -1, 0, 1, 0, -1, -1, -1, 0, 0, -1, -2, -1, 0,
0, -1, -1, -1, 0, 0, 0, -1, -1, 0, 0, 0, -1, -1, -1, 0, 0, -1, -1, -1,
0, 0, 0, -1, -1, 0, 0, 0, -1, -1, 0, 0, 0, -1, -1, -1, 0, 0, -1, -1,
-1, 0, 0, 0, -1, -1, 0, 0, 0, -1, -1, 0, 0, 0, -1, -1, -1, 0, 0, -1,
-1, -1, 0, 0, 0, -1, -1, 0, 0, 0, -1, -1, -1, 0, 0, -1, -1, -1, 0, 0,
0, -1, -1, 0, 0, 0, -1, -1, 0, 0, 0, -1, -1, -1, 0, 0, -1, -1, -1, 0,
0, 0, -1, -1, 0, 0, 0, -1, -1, 0, 0, 0, -1, -1, -1, 0, 0, -1, -1, -1,
0, 0, 0, -1, -1, 0, 0, 0, -1, -1, 0, 0, 0, -1, -1, -1, 0, 0, -1, -1,
-1, 0, 0, 0, -1, -1, 0, 0, 0, -1, -1, -1, 0, 0, -1, -1, -1, 0, 0, 0,
-1, -1, 0, 0, 0, -1, -1, 0, 0, 0, -1, -1, -1, 0, 0, -1, -1, -1, 0, 0,
0, -1, -1, 0, 0, 0, -1, -1, 0, 0, 0, -1, -1, -1, 0, 0, 0, -1, -1, 0,
0, 0, -1, -1, 0, 0, 0, -1, -1, -1, 0, 0, -1, -1, -1, 0, 0, 0, -1, -1,
0, 0, 0, -1, -1, 0, 0, 0, -1, -1, -1, 0, 0, -1, -1, -1, 0, 0, 0, -1,
-1, 0, 0, 0, -1, -1, 0, 0, 0, -1, -1, -1, 0, 0, 0, -1, -1, 0, 0, 0,
-1, -1, 0, 0, 0, -1, -1, 0, 0, 0, -1, -1, -1, 0, 0, 0, -1, -1, 0, 0,
0, -1, -1, 0, 0, 0, -1, -1, -1, 0, 0, -1, -1, -1, 0, 0, 0, -1, -1, 0,
0, 0, -1, -1, 0, 0, 0, -1, -1, -1, 0, 0, -1, -1, -1, 0, 0, 0, -1, -1,
0, 0, 0, -1, -1, -1, 0, 0, 0, -1, -1, 0, 0, 0, -1, -1, 0, 0, 0, -1,
-1, 0, 0, 0, -1, -1, -1, 0, 0, -1, -1, -1, 0, 0, -1, -1, -1, 0, 0, 0,
-1, -1, -1, 0, 0, 0, -1, 0, 0, 0, -1, -1, -1, 0, 0, 0, -1, -1, -1, 0,
0, -1, -1, -1, 0, 0, -1, -1, -1, 0, 0, 0, -1, -1, 0, 0, 0, -1, -1, 0,
0, 0, -1, -1, -1, 0, 0, -1, -1, -1, 0, 0, 0, -1, -1, 0, 0, 0, -1, -1,
-1, 0, 0, -1, -1, -1, 0, 0, -1, -1, -1, 0, 0, 0, -1, -1, -1, 0, -1, 0,
-1, 0, 0, 0, -1, -1, -1, 0, 0, -1, -1, -1, 0, 0, 0, -1, 0, -1, 0, 0,
-1, -1, -1, 0, 0, -1, -1, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0,
0, -1, -1, -1, 0, 0, -1, -1, -1, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0,
0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, -1, 0, -1, 0, -1, 0,
-1, 0, 0, 0, -1, 0, 0, 0, -1, -1, -1, 0, 0, -1, 0, -1, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0,
-1, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0,
-1, 0, -1, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, 0, 0,
-1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0,
0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, -1,
0, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, 0, -1,
0, 0, 0, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0,
-1, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1, 0, 0, -1, 0, 0, 0,
0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, 0, -1,
0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0,
0, 0, 0, -1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, -1, 0, 0, 0, 0,
0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, -1,
0, -1, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0,
0, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0, 0, 0, 0,
0, 0, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0,
-1, 0, -1, 0, -1, 0, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, 0,
0, 0, -1, 0, 0, -1, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, 0, 0, 0,
0, 0, -1, 0, -1, 0, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, 0,
0, 0, 0, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0,
0, -1, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, 0, -1, 0,
-1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, 0, -1, 0,
0, 0, 0, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0,
0, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1, -1, 0, -1, 0, -1, 0, 0, -1,
0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1,
0, -1, 0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0,
-1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0,
-1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, 0, 0, -1, 0, 0,
-1, 0, -1, 0, -1, -1, 0, -1, 0, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1,
0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1,
0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0, 0, -1, 0, -1, -1, 0,
-1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, -1, 0, -1,
-1, 0, -1, 0, -1, 0, -1, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0, -1, 0, 0,
-1, 0, 0, -1, 0, -1, 0, 0, 0, 0, 0, 0, -1, 0, -1, 0, -1, 0, -1, 0,
0, 0, 0, 0, -1, 0, -1, 0, 0, -1, 0, 0, -1, 0, 0, -1, 0, -1, 0, 0,
-1, 0, -1, };