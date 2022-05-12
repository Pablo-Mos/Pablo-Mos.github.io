//I’m okay with my submission being shown to the class, along with my name
#define REG_DISPCTL (*(volatile unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)

#define COLOR(r, g, b) ((r) | (g)<<5 | (b)<<10)
#define OFFSET(col, row, rowlen) ((row)*(rowlen)+(col))

#define SCANLINECOUNTER (*(volatile unsigned short *)0x4000006)

#define RED COLOR(31, 0, 0)
#define GREEN COLOR(0, 31, 0)
#define BLUE COLOR(0, 0, 31)
#define MAGENTA COLOR(31, 0, 31)
#define CYAN COLOR(0, 31, 31)
#define YELLOW COLOR(31, 31, 0)
#define BLACK 0
#define WHITE COLOR(31, 31, 31)

void setPixel(int, int, unsigned short color);
void drawRect(int col, int row, int width, int height, unsigned short color);
void waitForVBlank();

void frame1();
void frame2();
void frame3();
void frame4();

volatile unsigned short *videoBuffer = (unsigned short *)0x6000000;

#define BUTTON_A		(1<<0)
#define BUTTON_B		(1<<1)

unsigned short oldButtons;
unsigned short buttons;

#define BUTTONS (*(volatile unsigned short *)0x04000130)

#define BUTTON_PRESSED(key)((!(~oldButtons & key)) && (~buttons & (key)))

int c = 0;

int main() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;
    drawCurrFrame();

    while(1) {
    oldButtons = buttons;
	buttons = BUTTONS;
    if(BUTTON_PRESSED(BUTTON_A)){
        c++;
        drawCurrFrame();
    } 
    else if(BUTTON_PRESSED(BUTTON_B)){
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
    drawRect(125,70,10,10,YELLOW);
    drawRect(132,72,2,2,CYAN);
    drawRect(126,72,2,2,CYAN);
    drawRect(128,76,4,2,BLACK);
    drawRect(120,80,20,20,RED);
    drawRect(140,80,10,5,RED);
    drawRect(110,80,10,5,RED);
    drawRect(150,80,5,5,YELLOW);
    drawRect(105,80,5,5,YELLOW);
    drawRect(120,100,5,10,BLUE);
    drawRect(135,100,5,10,BLUE);
    drawRect(135,110,5,5,WHITE);
    drawRect(120,110,5,5,WHITE);
}
void frame1DEL() {
    drawRect(125,70,10,10,BLACK);
    drawRect(132,72,2,2,BLACK);
    drawRect(126,72,2,2,BLACK);
    drawRect(128,76,4,2,BLACK);
    drawRect(120,80,20,20,BLACK);
    drawRect(140,80,10,5,BLACK);
    drawRect(110,80,10,5,BLACK);
    drawRect(150,80,5,5,BLACK);
    drawRect(105,80,5,5,BLACK);
    drawRect(120,100,5,10,BLACK);
    drawRect(135,100,5,10,BLACK);
    drawRect(135,110,5,5,BLACK);
    drawRect(120,110,5,5,BLACK);
}

void frame2() {
    drawRect(120,70,10,10,YELLOW);
    drawRect(125,72,2,2,CYAN);
    drawRect(119,72,2,2,CYAN);
    drawRect(121,76,4,2,BLACK);
    drawRect(115,80,20,20,RED);
    drawRect(135,80,10,5,RED);
    drawRect(105,80,10,5,RED);
    drawRect(140,75,5,5,YELLOW);
    drawRect(105,75,5,5,YELLOW);
    drawRect(115,100,5,10,BLUE);
    drawRect(130,100,5,10,BLUE);
    drawRect(127,110,8,5,WHITE);
    drawRect(112,110,8,5,WHITE);
}
void frame2DEL() {
    drawRect(120,70,10,10,BLACK);
    drawRect(125,72,2,2,BLACK);
    drawRect(119,72,2,2,BLACK);
    drawRect(121,76,4,2,BLACK);
    drawRect(115,80,20,20,BLACK);
    drawRect(135,80,10,5,BLACK);
    drawRect(105,80,10,5,BLACK);
    drawRect(140,75,5,5,BLACK);
    drawRect(105,75,5,5,BLACK);
    drawRect(115,100,5,10,BLACK);
    drawRect(130,100,5,10,BLACK);
    drawRect(127,110,8,5,BLACK);
    drawRect(112,110,8,5,BLACK);
}

void frame3() {
    drawRect(125,50,10,10,YELLOW);
    drawRect(132,52,2,2,CYAN);
    drawRect(126,52,2,2,CYAN);
    drawRect(128,56,4,2,BLACK);
    drawRect(120,60,20,20,RED);
    drawRect(120,50,5,10,RED);
    drawRect(135,50,5,10,RED);
    drawRect(120,45,5,5,YELLOW);
    drawRect(135,45,5,5,YELLOW);
    drawRect(120,80,5,10,BLUE);
    drawRect(135,80,5,10,BLUE);
    drawRect(135,90,5,5,WHITE);
    drawRect(120,90,5,5,WHITE);
}
void frame3DEL() {
    drawRect(125,50,10,10,BLACK);
    drawRect(132,52,2,2,BLACK);
    drawRect(126,52,2,2,BLACK);
    drawRect(128,56,4,2,BLACK);
    drawRect(120,60,20,20,BLACK);
    drawRect(120,50,5,10,BLACK);
    drawRect(135,50,5,10,BLACK);
    drawRect(120,45,5,5,BLACK);
    drawRect(135,45,5,5,BLACK);
    drawRect(120,80,5,10,BLACK);
    drawRect(135,80,5,10,BLACK);
    drawRect(135,90,5,5,BLACK);
    drawRect(120,90,5,5,BLACK);
}

void frame4() {
    drawRect(130,70,10,10,YELLOW);
    drawRect(139,72,2,2,CYAN);
    drawRect(133,72,2,2,CYAN);
    drawRect(135,76,4,2,BLACK);
    drawRect(125,80,20,20,RED);
    drawRect(145,80,10,5,RED);
    drawRect(115,80,10,5,RED);
    drawRect(150,75,5,5,YELLOW);
    drawRect(115,75,5,5,YELLOW);
    drawRect(125,100,5,10,BLUE);
    drawRect(140,100,5,10,BLUE);
    drawRect(140,110,8,5,WHITE);
    drawRect(125,110,8,5,WHITE);
}
void frame4DEL() {
    drawRect(130,70,10,10,BLACK);
    drawRect(139,72,2,2,BLACK);
    drawRect(133,72,2,2,BLACK);
    drawRect(135,76,4,2,BLACK);
    drawRect(125,80,20,20,BLACK);
    drawRect(145,80,10,5,BLACK);
    drawRect(115,80,10,5,BLACK);
    drawRect(150,75,5,5,BLACK);
    drawRect(115,75,5,5,BLACK);
    drawRect(125,100,5,10,BLACK);
    drawRect(140,100,5,10,BLACK);
    drawRect(140,110,8,5,BLACK);
    drawRect(125,110,8,5,BLACK);
}

void setPixel(int col, int row, unsigned short color) {
    videoBuffer[OFFSET(col, row, 240)] = color;
}

void waitForVBlank() {
    while (SCANLINECOUNTER >= 160);
    while (SCANLINECOUNTER < 160);
}

void drawRect(int col, int row, int width, int height, unsigned short color) {
    for(int i=0; i<height; i++) {
        for(int j=0; j<width; j++){
            setPixel(col+j, row+i, color);
        }
    }    
}