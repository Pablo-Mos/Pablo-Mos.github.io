# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 20 "main.c"
void setPixel(int, int, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void waitForVBlank();

void frame1();
void frame2();
void frame3();
void frame4();

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;




unsigned short oldButtons;
unsigned short buttons;





int c = 0;

int main() {

    (*(volatile unsigned short *)0x4000000) = 3 | (1<<10);
    drawCurrFrame();

    while(1) {
    oldButtons = buttons;
 buttons = (*(volatile unsigned short *)0x04000130);
    if(((!(~oldButtons & (1<<0))) && (~buttons & ((1<<0))))){
        c++;
        drawCurrFrame();
    }
    else if(((!(~oldButtons & (1<<1))) && (~buttons & ((1<<1))))){
        c--;
        drawCurrFrame();
    }
    }
}

void drawCurrFrame(){
    waitForVBlank();
    if(c>3){
        c=0;
    }
    else if(c<0){
        c=3;
    }

    if(c==0){
        frame2DEL();
        frame3DEL();
        frame4DEL();
        frame1();
    }
    else if(c==1){
        frame1DEL();
        frame3DEL();
        frame4DEL();
        frame2();
    }
    else if(c==2){
        frame1DEL();
        frame2DEL();
        frame4DEL();
        frame3();
    }
    else if(c==3){
        frame1DEL();
        frame2DEL();
        frame3DEL();
        frame4();
    }
}

void frame1() {
    drawRect(125,70,10,10,((31) | (31)<<5 | (0)<<10));
    drawRect(132,72,2,2,((0) | (31)<<5 | (31)<<10));
    drawRect(126,72,2,2,((0) | (31)<<5 | (31)<<10));
    drawRect(128,76,4,2,0);
    drawRect(120,80,20,20,((31) | (0)<<5 | (0)<<10));
    drawRect(140,80,10,5,((31) | (0)<<5 | (0)<<10));
    drawRect(110,80,10,5,((31) | (0)<<5 | (0)<<10));
    drawRect(150,80,5,5,((31) | (31)<<5 | (0)<<10));
    drawRect(105,80,5,5,((31) | (31)<<5 | (0)<<10));
    drawRect(120,100,5,10,((0) | (0)<<5 | (31)<<10));
    drawRect(135,100,5,10,((0) | (0)<<5 | (31)<<10));
    drawRect(135,110,5,5,((31) | (31)<<5 | (31)<<10));
    drawRect(120,110,5,5,((31) | (31)<<5 | (31)<<10));
}
void frame1DEL() {
    drawRect(125,70,10,10,0);
    drawRect(132,72,2,2,0);
    drawRect(126,72,2,2,0);
    drawRect(128,76,4,2,0);
    drawRect(120,80,20,20,0);
    drawRect(140,80,10,5,0);
    drawRect(110,80,10,5,0);
    drawRect(150,80,5,5,0);
    drawRect(105,80,5,5,0);
    drawRect(120,100,5,10,0);
    drawRect(135,100,5,10,0);
    drawRect(135,110,5,5,0);
    drawRect(120,110,5,5,0);
}

void frame2() {
    drawRect(120,70,10,10,((31) | (31)<<5 | (0)<<10));
    drawRect(125,72,2,2,((0) | (31)<<5 | (31)<<10));
    drawRect(119,72,2,2,((0) | (31)<<5 | (31)<<10));
    drawRect(121,76,4,2,0);
    drawRect(115,80,20,20,((31) | (0)<<5 | (0)<<10));
    drawRect(135,80,10,5,((31) | (0)<<5 | (0)<<10));
    drawRect(105,80,10,5,((31) | (0)<<5 | (0)<<10));
    drawRect(140,75,5,5,((31) | (31)<<5 | (0)<<10));
    drawRect(105,75,5,5,((31) | (31)<<5 | (0)<<10));
    drawRect(115,100,5,10,((0) | (0)<<5 | (31)<<10));
    drawRect(130,100,5,10,((0) | (0)<<5 | (31)<<10));
    drawRect(127,110,8,5,((31) | (31)<<5 | (31)<<10));
    drawRect(112,110,8,5,((31) | (31)<<5 | (31)<<10));
}
void frame2DEL() {
    drawRect(120,70,10,10,0);
    drawRect(125,72,2,2,0);
    drawRect(119,72,2,2,0);
    drawRect(121,76,4,2,0);
    drawRect(115,80,20,20,0);
    drawRect(135,80,10,5,0);
    drawRect(105,80,10,5,0);
    drawRect(140,75,5,5,0);
    drawRect(105,75,5,5,0);
    drawRect(115,100,5,10,0);
    drawRect(130,100,5,10,0);
    drawRect(127,110,8,5,0);
    drawRect(112,110,8,5,0);
}

void frame3() {
    drawRect(125,50,10,10,((31) | (31)<<5 | (0)<<10));
    drawRect(132,52,2,2,((0) | (31)<<5 | (31)<<10));
    drawRect(126,52,2,2,((0) | (31)<<5 | (31)<<10));
    drawRect(128,56,4,2,0);
    drawRect(120,60,20,20,((31) | (0)<<5 | (0)<<10));
    drawRect(120,50,5,10,((31) | (0)<<5 | (0)<<10));
    drawRect(135,50,5,10,((31) | (0)<<5 | (0)<<10));
    drawRect(120,45,5,5,((31) | (31)<<5 | (0)<<10));
    drawRect(135,45,5,5,((31) | (31)<<5 | (0)<<10));
    drawRect(120,80,5,10,((0) | (0)<<5 | (31)<<10));
    drawRect(135,80,5,10,((0) | (0)<<5 | (31)<<10));
    drawRect(135,90,5,5,((31) | (31)<<5 | (31)<<10));
    drawRect(120,90,5,5,((31) | (31)<<5 | (31)<<10));
}
void frame3DEL() {
    drawRect(125,50,10,10,0);
    drawRect(132,52,2,2,0);
    drawRect(126,52,2,2,0);
    drawRect(128,56,4,2,0);
    drawRect(120,60,20,20,0);
    drawRect(120,50,5,10,0);
    drawRect(135,50,5,10,0);
    drawRect(120,45,5,5,0);
    drawRect(135,45,5,5,0);
    drawRect(120,80,5,10,0);
    drawRect(135,80,5,10,0);
    drawRect(135,90,5,5,0);
    drawRect(120,90,5,5,0);
}

void frame4() {
    drawRect(130,70,10,10,((31) | (31)<<5 | (0)<<10));
    drawRect(139,72,2,2,((0) | (31)<<5 | (31)<<10));
    drawRect(133,72,2,2,((0) | (31)<<5 | (31)<<10));
    drawRect(135,76,4,2,0);
    drawRect(125,80,20,20,((31) | (0)<<5 | (0)<<10));
    drawRect(145,80,10,5,((31) | (0)<<5 | (0)<<10));
    drawRect(115,80,10,5,((31) | (0)<<5 | (0)<<10));
    drawRect(150,75,5,5,((31) | (31)<<5 | (0)<<10));
    drawRect(115,75,5,5,((31) | (31)<<5 | (0)<<10));
    drawRect(125,100,5,10,((0) | (0)<<5 | (31)<<10));
    drawRect(140,100,5,10,((0) | (0)<<5 | (31)<<10));
    drawRect(140,110,8,5,((31) | (31)<<5 | (31)<<10));
    drawRect(125,110,8,5,((31) | (31)<<5 | (31)<<10));
}
void frame4DEL() {
    drawRect(130,70,10,10,0);
    drawRect(139,72,2,2,0);
    drawRect(133,72,2,2,0);
    drawRect(135,76,4,2,0);
    drawRect(125,80,20,20,0);
    drawRect(145,80,10,5,0);
    drawRect(115,80,10,5,0);
    drawRect(150,75,5,5,0);
    drawRect(115,75,5,5,0);
    drawRect(125,100,5,10,0);
    drawRect(140,100,5,10,0);
    drawRect(140,110,8,5,0);
    drawRect(125,110,8,5,0);
}

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[((row)*(240)+(col))] = color;
}

void waitForVBlank() {
    while ((*(volatile unsigned short *)0x4000006) >= 160);
    while ((*(volatile unsigned short *)0x4000006) < 160);
}

void drawRect(int col, int row, int width, int height, unsigned short color) {
    for(int i=0; i<height; i++) {
        for(int j=0; j<width; j++){
            setPixel(col+j, row+i, color);
        }
    }
}
