# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "tetrisLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 62 "tetrisLib.h"
extern volatile unsigned short *videoBuffer;
# 83 "tetrisLib.h"
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
# 152 "tetrisLib.h"
void hideSprites();






typedef struct {
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
# 190 "tetrisLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;






typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 238 "tetrisLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 270 "tetrisLib.h"
typedef void (*ihp)(void);
# 288 "tetrisLib.h"
int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2
# 1 "tetreminos.h" 1
# 22 "tetreminos.h"
extern const unsigned short tetreminosTiles[16384];


extern const unsigned short tetreminosMap[1024];


extern const unsigned short tetreminosPal[256];
# 3 "main.c" 2
# 1 "game.h" 1

void updatePieceSprites();
void addPiecesToBackground();
void drawGame();
void startGame();
void updateGame();
void clearRow(int);
void checkForRowClear();
int checkIfRowIsFilled(int);
int checkForCollision(int collisionMapIndex, int col, int row);
void spawnTetremino();
int rand();
void setupGameboard();
# 4 "main.c" 2
# 1 "main_menu.h" 1
# 22 "main_menu.h"
extern const unsigned short main_menuTiles[5712];


extern const unsigned short main_menuMap[1024];


extern const unsigned short main_menuPal[256];
# 5 "main.c" 2
# 1 "pause.h" 1
# 22 "pause.h"
extern const unsigned short pauseTiles[208];


extern const unsigned short pauseMap[1024];


extern const unsigned short pausePal[256];
# 6 "main.c" 2
# 1 "win.h" 1
# 22 "win.h"
extern const unsigned short winTiles[384];


extern const unsigned short winMap[1024];


extern const unsigned short winPal[256];
# 7 "main.c" 2
# 1 "lose.h" 1
# 22 "lose.h"
extern const unsigned short loseTiles[416];


extern const unsigned short loseMap[1024];


extern const unsigned short losePal[256];
# 8 "main.c" 2
# 1 "sound.h" 1
void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void setupInterrupts();
void interruptHandler();

void pauseSound();
void unpauseSound();
void stopSound();
# 49 "sound.h"
typedef struct{
    const signed char* data;
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
# 9 "main.c" 2
# 1 "gameSong.h" 1


extern const unsigned int gameSong_sampleRate;
extern const unsigned int gameSong_length;
extern const signed char gameSong_data[];
# 10 "main.c" 2
# 1 "loseSong.h" 1


extern const unsigned int loseSong_sampleRate;
extern const unsigned int loseSong_length;
extern const signed char loseSong_data[];
# 11 "main.c" 2
# 1 "winSong.h" 1


extern const unsigned int winSong_sampleRate;
extern const unsigned int winSong_length;
extern const signed char winSong_data[];
# 12 "main.c" 2
# 1 "startSong.h" 1


extern const unsigned int startSong_sampleRate;
extern const unsigned int startSong_length;
extern const signed char startSong_data[];
# 13 "main.c" 2




void initialize();


void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();


enum
{
    START,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;


unsigned short buttons;
unsigned short oldButtons;


OBJ_ATTR shadowOAM[128];

int main()
{
    initialize();

    while (1)
    {

        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


        switch (state)
        {
        case START:
            start();
            break;
        case GAME:
            game();
            break;
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
            break;
        case LOSE:
            lose();
            break;
        }
    }
}


void initialize()
{


    DMANow(3, tetreminosTiles, &((charblock *)0x6000000)[1], 32768 / 2);


    DMANow(3, tetreminosPal, ((unsigned short *)0x5000200), 512 / 2);
    DMANow(3, tetreminosTiles, &((charblock *)0x6000000)[4], 32768 / 2);

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);

    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((31)<<8) | (0<<7) | (0<<14);

    buttons = (*(volatile unsigned short *)0x04000130);
    oldButtons = 0;

    setupSounds();
    setupInterrupts();

    goToStart();
}


void goToStart()
{
    state = START;


    playSoundA(startSong_data, startSong_length, 1);

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8);
    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((7)<<8) | (0<<7) | (0<<14);


    DMANow(3, main_menuPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, main_menuTiles, &((charblock *)0x6000000)[0], 11424 / 2);
    DMANow(3, main_menuMap, &((screenblock *)0x6000000)[7], 2048 / 2);
}

int seed = 0;


void start()
{
    seed++;
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))) || (!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2)))))
    {
        setupGameboard();
        goToGame();


        stopSound();
        playSoundA(gameSong_data, gameSong_length, 1);
    }
}


void goToGame()
{
    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
    (*(volatile unsigned short*)0x4000008) = ((1)<<2) | ((15)<<8) | (0<<7) | (0<<14);
    DMANow(3, tetreminosPal, ((unsigned short *)0x5000000), 512 / 2);

    srand(seed);
    state = GAME;
    startGame();
}


void game()
{
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
    {
        goToPause();


        pauseSound();
    }


    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2)))))
    {

    }
    if ((!(~(oldButtons)&((1<<8))) && (~buttons & ((1<<8)))))
    {
        goToWin();
    }
    if ((!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9)))))
    {
        goToLose();
    }

    updateGame();
    waitForVBlank();
    drawGame();
}


void goToPause()
{
    state = PAUSE;

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8);


    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((7)<<8) | (0<<7) | (0<<14);
    DMANow(3, pausePal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, pauseTiles, &((charblock *)0x6000000)[0], 416 / 2);
    DMANow(3, pauseMap, &((screenblock *)0x6000000)[7], 2048 / 2);
}


void pause()
{
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
    {
        goToGame();


        unpauseSound();
    }
}


void goToWin()
{
    state = WIN;

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8);


    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((7)<<8) | (0<<7) | (0<<14);
    DMANow(3, winPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, winTiles, &((charblock *)0x6000000)[0], 768 / 2);
    DMANow(3, winMap, &((screenblock *)0x6000000)[7], 2048 / 2);


    stopSound();
    playSoundA(winSong_data, winSong_length, 1);
}


void win()
{
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
    {
        goToStart();
    }
}


void goToLose()
{
    state = LOSE;

    (*(volatile unsigned short *)0x4000000) = 0 | (1<<8);


    (*(volatile unsigned short*)0x4000008) = ((0)<<2) | ((7)<<8) | (0<<7) | (0<<14);

    DMANow(3, losePal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, loseTiles, &((charblock *)0x6000000)[0], 832 / 2);
    DMANow(3, loseMap, &((screenblock *)0x6000000)[7], 2048 / 2);


    stopSound();
    playSoundA(loseSong_data, loseSong_length, 1);
}


void lose()
{
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3)))))
    {
        goToStart();
    }
}
