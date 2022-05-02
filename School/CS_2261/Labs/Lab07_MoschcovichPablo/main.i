# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "lab07Lib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "lab07Lib.h"
extern unsigned short *videoBuffer;
# 85 "lab07Lib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 157 "lab07Lib.h"
void hideSprites();
# 178 "lab07Lib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 189 "lab07Lib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 229 "lab07Lib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2
# 1 "gameBg.h" 1
# 22 "gameBg.h"
extern const unsigned short gameBgTiles[1856];


extern const unsigned short gameBgMap[4096];


extern const unsigned short gameBgPal[256];
# 3 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 4 "main.c" 2





void initialize();

unsigned short buttons;
unsigned short oldButtons;

int hOff = 0;
int vOff = 0;

OBJ_ATTR shadowOAM[128];

typedef struct {
    int row;
    int col;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
} ANISPRITE;

ANISPRITE link;
ANISPRITE fairy[4];





enum { SPRITEFRONT, SPRITEBACK, SPRITERIGHT, SPRITELEFT, SPRITEIDLE};

int main() {

    initialize();

    while(1) {






        if(link.aniState != SPRITEIDLE) {
   link.prevAniState = link.aniState;
   link.aniState = SPRITEIDLE;
  }



        if(link.aniCounter % 15 == 0) {


            if (link.curFrame < link.numFrames - 1) {
    link.curFrame++;
   } else {
    link.curFrame = 0;
   }
        }



        if((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {

            link.aniState = SPRITEBACK;
            vOff--;
        }
        if((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {

   link.aniState = SPRITEFRONT;
            vOff++;
        }
        if((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {

   link.aniState = SPRITELEFT;
            hOff--;
        }
        if((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {

   link.aniState = SPRITERIGHT;
            hOff++;
        }





        if (link.aniState == SPRITEIDLE) {
   link.curFrame = 0;
   link.aniState = link.prevAniState;
  } else {
   link.aniCounter++;
  }
# 114 "main.c"
        shadowOAM[0].attr0 = link.row | (0<<13) | (0<<14);
  shadowOAM[0].attr1 = link.col | (2<<14);
  shadowOAM[0].attr2 = ((0)<<12) | ((link.curFrame * 4)*32+(link.aniState * 4));
# 126 "main.c"
        for (int i=0; i<4; i++) {
   fairy[i].aniCounter++;
   if(fairy[i].aniCounter % 12 == 0) {
    if(fairy[i].curFrame < fairy[i].numFrames - 1) {
     fairy[i].curFrame++;
    } else {
     fairy[i].curFrame = 0;
    }
   }
  }
# 150 "main.c"
        for (int i=0; i<4; i++) {
   shadowOAM[1+i].attr0 = fairy[i].row | (0<<13) | (0<<14);
   shadowOAM[1+i].attr1 = fairy[i].col | (1<<14);
   shadowOAM[1+i].attr2 = ((0)<<12) | (((fairy[i].curFrame)*2 + 12)*32+(0));
  }


        waitForVBlank();


  DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);


        (*(volatile unsigned short *)0x04000010) = hOff;
        (*(volatile unsigned short *)0x04000012) = vOff;
    }

    return 0;
}


void initialize() {


    DMANow(3, gameBgPal, ((unsigned short *)0x5000000), 256);
    DMANow(3, gameBgTiles, &((charblock *)0x6000000)[0], 3712 / 2);
    DMANow(3, gameBgMap, &((screenblock *)0x6000000)[28], 1024 * 4);



    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((28)<<8) | (0<<7) | (3<<14);



    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 256);
 DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);




 hideSprites();


    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);


    link.width = 32;
    link.height = 32;
    link.cdel = 1;
    link.rdel = 1;
    link.col = 240/2 - (link.width/2);
    link.row = 160/2 - (link.height/2) + 36;
# 210 "main.c"
    link.aniCounter = 0;
    link.curFrame = 0;
    link.numFrames = 3;
    link.aniState = SPRITEFRONT;


    for(int i = 0; i < 4; i++){
        fairy[i].width = 16;
        fairy[i].height = 16;

        fairy[i].col = 240/2 - (fairy[i].width/2 * i * 4) + 36;
        fairy[i].row = 160 - (fairy[i].height);
# 233 "main.c"
        fairy[i].aniCounter = 0;
        fairy[i].curFrame = 0;
        fairy[i].numFrames = 3;
        fairy[i].aniState = SPRITEFRONT;
    }

    buttons = (*(volatile unsigned short *)0x04000130);


    hOff = 134;
    vOff = 172;

}
