# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "lab09lib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "lab09lib.h"
extern unsigned short *videoBuffer;
# 85 "lab09lib.h"
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
# 157 "lab09lib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 200 "lab09lib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 211 "lab09lib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 251 "lab09lib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 292 "lab09lib.h"
typedef void (*ihp_t)(void);
# 353 "lab09lib.h"
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2
# 1 "digits.h" 1
# 21 "digits.h"
extern const unsigned short digitsTiles[16384];


extern const unsigned short digitsPal[256];
# 3 "main.c" 2


int time_m;
int time_s;
int time_cs;

short digit_to_sprite_tile_index[] = {132, 0, 4, 8, 12, 16, 20, 24, 28, 128};


inline void haltUntilInterrupt()
{
  __asm__("swi 0x04 << 15");
}

void displayTime()
{
  short time_m_1s = time_m % 10;
  short time_m_10s = time_m / 10;
  short time_s_1s = time_s % 10;
  short time_s_10s = time_s / 10;
  short time_cs_1s = time_cs % 10;
  short time_cs_10s = time_cs / 10;

  char y = 64;
  char x = 8;
  shadowOAM[0].attr0 = (1<<8) | y;
  shadowOAM[0].attr1 = (2<<14) | x;
  shadowOAM[0].attr2 = digit_to_sprite_tile_index[time_m_10s];

  shadowOAM[1].attr0 = (1<<8) | y;
  shadowOAM[1].attr1 = (2<<14) | (x + 32);
  shadowOAM[1].attr2 = digit_to_sprite_tile_index[time_m_1s];

  shadowOAM[2].attr0 = (2<<14) | (1<<8) | y;
  shadowOAM[2].attr1 = (2<<14) | (x + 64);
  shadowOAM[2].attr2 = 136;

  shadowOAM[3].attr0 = (1<<8) | y;
  shadowOAM[3].attr1 = (2<<14) | (x + 64 + 16);
  shadowOAM[3].attr2 = digit_to_sprite_tile_index[time_s_10s];

  shadowOAM[4].attr0 = (1<<8) | y;
  shadowOAM[4].attr1 = (2<<14) | (x + 64 + 16 + 32);
  shadowOAM[4].attr2 = digit_to_sprite_tile_index[time_s_1s];

  shadowOAM[5].attr0 = (2<<14) | (1<<8) | y;
  shadowOAM[5].attr1 = (2<<14) | (x + 64 + 16 + 64);
  shadowOAM[5].attr2 = 138;

  shadowOAM[6].attr0 = (1<<8) | y;
  shadowOAM[6].attr1 = (2<<14) | (x + 64 + 16 + 64 + 16);
  shadowOAM[6].attr2 = digit_to_sprite_tile_index[time_cs_10s];

  shadowOAM[7].attr0 = (1<<8) | y;
  shadowOAM[7].attr1 = (2<<14) | (x + 64 + 16 + 64 + 16 + 32);
  shadowOAM[7].attr2 = digit_to_sprite_tile_index[time_cs_1s];
}


void interruptHandler(void)
{

  *(unsigned short*)0x4000208 = 0;






  if (*(volatile unsigned short*)0x4000202 & 1<<3)
  {
    time_cs++;
    if (time_cs > 99)
      time_cs = 0;
  }





  if (*(volatile unsigned short*)0x4000202 & 1<<4)
  {
    time_s++;
    if (time_s > 59)
    {
      time_s = time_s - 60;
    }
  }





  if (*(volatile unsigned short*)0x4000202 & 1<<5)
  {
    time_m++;
  }





  if (*(volatile unsigned short*)0x4000202 & 1 << 0)
  {
    displayTime();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
  }


  if ((*(volatile unsigned short*)0x4000202 & 1 << 12) && (~(*(volatile unsigned short *)0x04000130) & (1<<0)))
  {
    ((unsigned short *)0x5000000)[0] += 17;
  }



  if ((*(volatile unsigned short*)0x4000202 & 1 << 12) && (~(*(volatile unsigned short *)0x04000130) & (1<<3)))
  {
    *(volatile unsigned short*)0x4000102 = (0<<7);
    *(volatile unsigned short*)0x4000106 = (0<<7);
    *(volatile unsigned short*)0x400010A = (0<<7);
    time_m = 0;
    time_s = 0;
    time_cs = 0;
    *(volatile unsigned short*)0x4000102 = 3 | (1<<7) | (1<<6);
    *(volatile unsigned short*)0x4000106 = 3 | (1<<7) | (1<<6);
    *(volatile unsigned short*)0x400010A = (1<<2) | (1<<7) | (1<<6);
  }

  if ((*(volatile unsigned short*)0x4000202 & 1 << 12) && (~(*(volatile unsigned short *)0x04000130) & (1<<2)))
  {
    *(volatile unsigned short*)0x4000102 = (0<<7);
    *(volatile unsigned short*)0x4000106 = (0<<7);
    *(volatile unsigned short*)0x400010A = (0<<7);
  }

  *(volatile unsigned short*)0x4000202 = *(volatile unsigned short*)0x4000202;

  *(unsigned short*)0x4000208 = 1;
}


void enableTimerInterrupts(void)
{

  *(unsigned short*)0x4000200 = 1<<3 | 1<<4 | 1<<5;

  *(volatile unsigned short*)0x4000102 = 0;
  *(volatile unsigned short*)0x4000100 = 65536 - 164;
  *(volatile unsigned short*)0x4000102 = 3 | (1<<7) | (1<<6);

  *(volatile unsigned short*)0x4000106 = 0;
  *(volatile unsigned short*)0x4000104 = 65536 - 16384;
  *(volatile unsigned short*)0x4000106 = 3 | (1<<7) | (1<<6);


  *(volatile unsigned short*)0x400010A = 0;
  *(volatile unsigned short*)0x4000108 = 65536 - 60;
  *(volatile unsigned short*)0x400010A = (1<<2) | (1<<7) | (1<<6);
}

void setupInterrupts(void)
{
  *(unsigned short*)0x4000208 = 0;
  *((ihp_t *)0x03007FFC) = (unsigned int)interruptHandler;
  enableTimerInterrupts();
  *(unsigned short*)0x4000200 |= 1 << 0;
  *(unsigned short*)0x4000004 |= 1 << 3;
  *(unsigned short*)0x4000200 |= 1 << 12;
  (*(volatile unsigned short *)0x04000132) = (1<<2) | (1<<3) | (1<<0) | 1 << 14;
  *(unsigned short*)0x4000208 = 1;
# 183 "main.c"
}


int main()
{
  (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);


  shadowOAM[0].fill = 256;
  shadowOAM[3].fill = 256;


  hideSprites();


  setupInterrupts();


  DMANow(3, digitsPal, ((unsigned short *)0x5000200), 512 / 2);
  DMANow(3, digitsTiles, &((charblock *)0x6000000)[4], 32768 / 2);

  while (1)
    haltUntilInterrupt();
}
