# 1 "lab01.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lab01.c"
# 24 "lab01.c"
void setPixel(int, int, unsigned short);
void drawRect(int, int, unsigned short);
void drawParallelogram(int, int, unsigned short);



volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;
# 40 "lab01.c"
int main() {

    (*(volatile unsigned short *)0x4000000) = 3 | (1<<10);


    setPixel(2,5,((0) | (31)<<5 | (0)<<10));

    drawRect(15,22,((31) | (0)<<5 | (0)<<10));
    drawRect(55,80,((0) | (0)<<5 | (31)<<10));

    drawParallelogram(90,60, ((0) | (31)<<5 | (31)<<10));

    while(1);
}


void setPixel(int col, int row, unsigned short color) {
    videoBuffer[((row)*(240)+(col))] = color;
}

void drawRect(int col, int row, unsigned short color) {
    for(int i=0; i<10; i++) {
        for(int j=0; j<20; j++){
            setPixel(col+j, row+i, color);
        }
    }
}

void drawParallelogram(int col, int row, unsigned short color) {
    int x=0;
    for(int i=0; i<45; i++) {
        for(int j=0; j<38; j++){
            setPixel(col+j+x, row+i, color);
        }
        x++;
    }
}
