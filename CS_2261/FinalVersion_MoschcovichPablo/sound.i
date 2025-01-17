# 1 "sound.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sound.c"
# 1 "mode0.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "mode0.h"
extern volatile unsigned short *videoBuffer;
# 85 "mode0.h"
typedef struct
{
    u16 tileimg[8192];
} charblock;


typedef struct
{
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




typedef struct
{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 159 "mode0.h"
void hideSprites();
# 180 "mode0.h"
typedef struct
{
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
} SPRITE;
# 214 "mode0.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 224 "mode0.h"
typedef volatile struct
{
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 265 "mode0.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 301 "mode0.h"
typedef void (*ihp)(void);
# 321 "mode0.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "sound.c" 2
# 1 "sound.h" 1
void setupSounds();
void playSoundA(const signed char *sound, int length, int loops);
void playSoundB(const signed char *sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
# 48 "sound.h"
typedef struct
{
    const signed char *data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 3 "sound.c" 2
int time_m;
int time_s;
void setupSounds()
{

    *(volatile u16 *)0x04000084 = (1 << 7);

    *(volatile u16 *)0x04000082 = (1 << 1) |
                     (1 << 2) |
                     (3 << 8) |
                     (0 << 10) |
                     (1 << 11) |
                     (1 << 3) |
                     (3 << 12) |
                     (1 << 14) |
                     (1 << 15);

    *(u16 *)0x04000080 = 0;
}

void playSoundA(const signed char *sound, int length, int loops)
{
    dma[1].cnt = 0;

    int ticks = (16777216) / 11025;

    DMANow(1, sound, (u16 *)0x040000A0, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

    *(volatile unsigned short *)0x4000102 = 0;

    *(volatile unsigned short *)0x4000100 = -ticks;
    *(volatile unsigned short *)0x4000102 = (1 << 7);

    soundA.data = sound;
    soundA.length = length;
    soundA.loops = loops;
    soundA.isPlaying = 1;
    soundA.duration = ((59.727) * length) / 11025;
    soundA.vBlankCount = 0;
}

void playSoundB(const signed char *sound, int length, int loops)
{

    dma[2].cnt = 0;

    int ticks = (16777216) / 11025;

    DMANow(2, sound, (u16 *)0x040000A4, (2 << 21) | (3 << 28) | (1 << 25) | (1 << 26));

    *(volatile unsigned short *)0x4000106 = 0;

    *(volatile unsigned short *)0x4000104 = -ticks;
    *(volatile unsigned short *)0x4000106 = (1 << 7);

    soundB.data = sound;
    soundB.length = length;
    soundB.loops = loops;
    soundB.isPlaying = 1;
    soundB.duration = ((59.727) * length) / 11025;
    soundB.vBlankCount = 0;
}

void setupInterrupts()
{
    *(unsigned short *)0x4000208 = 0;

    *(unsigned short *)0x4000200 |= 1 << 0;
    *(unsigned short *)0x4000004 |= 1 << 3;

    *((ihp *)0x03007FFC) = interruptHandler;
    enableTimerInterrupts();

    *(unsigned short *)0x4000208 = 1;
}
void enableTimerInterrupts(void)
{
    *(unsigned short *)0x4000200 = 1 << 5 | 1 << 6;
    *(volatile unsigned short *)0x400010A = 0;
    *(volatile unsigned short *)0x4000108 = 65536 - 164;
    *(volatile unsigned short *)0x400010A = 3 | (1 << 7) | (1 << 6);
    *(volatile unsigned short *)0x400010E = 0;
    *(volatile unsigned short *)0x400010C = 65536 - 16384;
    *(volatile unsigned short *)0x400010E = 3 | (1 << 7) | (1 << 6);
}
void interruptHandler()
{
    *(unsigned short *)0x4000208 = 0;
    if (*(volatile unsigned short *)0x4000202 & 1 << 6)
    {
        time_s--;
        if (time_s < 0)
        {
            time_s = time_s + 60;
            time_m--;
        }
    }
    if (*(volatile unsigned short *)0x4000202 & 1 << 0)
    {
        if (soundA.isPlaying)
        {

            soundA.vBlankCount = soundA.vBlankCount + 1;
            if (soundA.vBlankCount > soundA.duration)
            {
                if (soundA.loops)
                {
                    playSoundA(soundA.data, soundA.length, soundA.loops);
                }
                else
                {
                    soundA.isPlaying = 0;
                    dma[1].cnt = 0;
                    *(volatile unsigned short *)0x4000102 = (0 << 7);
                }
            }
        }

        if (soundB.isPlaying)
        {

            soundB.vBlankCount = soundB.vBlankCount + 1;
            if (soundB.vBlankCount > soundB.duration)
            {
                if (soundB.loops)
                {
                    playSoundB(soundB.data, soundB.length, soundB.loops);
                }
                else
                {
                    soundB.isPlaying = 0;
                    dma[2].cnt = 0;
                    *(volatile unsigned short *)0x4000106 = (0 << 7);
                }
            }
        }

        *(volatile unsigned short *)0x4000202 = 1 << 0;
    }
    *(volatile unsigned short *)0x4000202 = *(volatile unsigned short *)0x4000202;

    *(unsigned short *)0x4000208 = 1;
}

void pauseSound()
{
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    *(volatile unsigned short *)0x4000102 = (0 << 7);
    *(volatile unsigned short *)0x4000106 = (0 << 7);
}

void unpauseSound()
{
    soundA.isPlaying = 1;
    soundB.isPlaying = 1;
    *(volatile unsigned short *)0x4000102 = (1 << 7);
    *(volatile unsigned short *)0x4000106 = (1 << 7);
}

void stopSound()
{
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    *(volatile unsigned short *)0x4000102 = (0 << 7);
    *(volatile unsigned short *)0x4000106 = (0 << 7);
    dma[1].cnt = 0;
    dma[2].cnt = 0;
}
