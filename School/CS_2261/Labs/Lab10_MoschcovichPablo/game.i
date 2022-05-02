# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
# 1 "tetreminos.h" 1
# 22 "tetreminos.h"
extern const unsigned short tetreminosTiles[16384];


extern const unsigned short tetreminosMap[1024];


extern const unsigned short tetreminosPal[256];
# 3 "game.c" 2
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
# 4 "game.c" 2
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
# 5 "game.c" 2
# 1 "rowClearSound.h" 1


extern const unsigned int rowClearSound_sampleRate;
extern const unsigned int rowClearSound_length;
extern const signed char rowClearSound_data[];
# 6 "game.c" 2




extern int collisionMaps[28][16];

unsigned short gameboard[32][32];

extern void goToLose();
extern void goToWin();


enum
{
    T,
    L,
    SKEW,
    SQUARE,
    STRAIGHT,
    SKEW2,
    L2
};

int currentTetreminoType;
int currentTetreminoRotation;
int currentTetreminoCol;
int currentTetreminoRow;

int linesCleared = 0;





int checkIfRowIsFilled(int row)
{

    for (int col = 1; col < 12 + 1; col++)
    {

        if (((screenblock *)0x6000000)[15].tilemap[((row)*(32)+(col))] == 0)
        {
            return 0;
        }
    }
    return 1;
}

void clearRow(int row)
{

    playSoundB(rowClearSound_data, rowClearSound_length, 0);




    for (int i = row; i > 0; i--)
    {
        for (int j = 0; j < 12 + 1; j++)
        {

            ((screenblock *)0x6000000)[15].tilemap[((i)*(32)+(j))] = ((screenblock *)0x6000000)[15].tilemap[((i - 1)*(32)+(j))];
        }
    }
}


void addPiecesToBackground()
{
    for (int i = 0; i < 4; i++)
    {
        for (int j = 0; j < 4; j++)
        {


            if (collisionMaps[(currentTetreminoType * 4) + currentTetreminoRotation][4 * j + i] != 0)
            {







                int tileIndex = ((currentTetreminoRow + j)*(32)+(currentTetreminoCol + i));
                ((screenblock *)0x6000000)[15].tilemap[tileIndex] = collisionMaps[(currentTetreminoType * 4) + currentTetreminoRotation][4 * j + i];
            }
        }
    }
}






void checkForRowClear()
{
    for (int i = 0; i < 19; i++)
    {
        if (checkIfRowIsFilled(i))
        {
            clearRow(i);
            linesCleared++;
            if (linesCleared >= 5)
            {
                goToWin();
            }
        }
    }
}



void rotatePiecesCCW()
{
    int newRotation = currentTetreminoRotation - 1;
    if (newRotation < 0)
    {
        newRotation = 3;
    }


    if (checkForCollision((currentTetreminoType * 4) + newRotation, currentTetreminoCol, currentTetreminoRow) == 0)
    {
        currentTetreminoRotation = newRotation;
    }
}
void rotatePiecesCW()
{
    int newRotation = (currentTetreminoRotation + 1) % 4;
    if (checkForCollision((currentTetreminoType * 4) + newRotation, currentTetreminoCol, currentTetreminoRow) == 0)
    {
        currentTetreminoRotation = newRotation;
    }
}



int skipFrames = 0;
void updatePieces()
{
    if (skipFrames < 10)
    {
        skipFrames++;
        return;
    }
    else
    {
        skipFrames = 0;
    }

    if (checkForCollision((currentTetreminoType * 4) + currentTetreminoRotation, currentTetreminoCol, currentTetreminoRow + 1) == 1)
    {
        if (currentTetreminoRow == 0)
        {
            goToLose();
        }
        addPiecesToBackground();
        spawnTetremino();
    }
    else
    {
        currentTetreminoRow++;
    }
}

void updatePieceSprites()
{
    int spriteIndex = 0;


    for (int i = 0; i < 4; i++)
    {
        for (int j = 0; j < 4; j++)
        {
            if (collisionMaps[(currentTetreminoType * 4) + currentTetreminoRotation][4 * j + i] != 0)
            {
                shadowOAM[spriteIndex].attr0 = (currentTetreminoRow + j) * 8 | (0<<14);
                shadowOAM[spriteIndex].attr1 = (currentTetreminoCol + i) * 8 | (0<<14);
                shadowOAM[spriteIndex].attr2 = ((0)<<12) | ((0)*32+(currentTetreminoType + 1));

                spriteIndex++;
            }
        }
    }
}

int checkForCollision(int collisionMapIndex, int col, int row)
{
    int valueToReturn = 0;


    for (int i = 0; i < 4; i++)
    {
        for (int j = 0; j < 4; j++)
        {
            if (((screenblock *)0x6000000)[15].tilemap[((row + j)*(32)+(col + i))] != 0 && collisionMaps[collisionMapIndex][4 * j + i] != 0)
            {
                valueToReturn = 1;
            }
        }
    }

    return valueToReturn;
}

void spawnTetremino()
{
    currentTetreminoType = rand() % 7;

    currentTetreminoCol = 12 / 2 - 1;
    currentTetreminoRow = 0;
    currentTetreminoRotation = 0;
}



void startGame()
{
    linesCleared = 0;
    if (currentTetreminoRow == 0)
    {
        spawnTetremino();
    }
}

void setupGameboard()
{
# 243 "game.c"
    u16 grayTile = 8 | (2 << 11);
    u16 solidGray = 9 | (2 << 11);


    for (int i = 0; i < 32; i++)
    {
        for (int j = 0; j < 32; j++)
        {
            gameboard[i][j] = 0;
        }
    }


    for (int i = 0; i <= 19; i++)
    {
        gameboard[i][0] = grayTile;
    }
    for (int i = 0; i <= 19; i++)
    {
        gameboard[i][12 + 1] = grayTile;
    }
    for (int i = 0; i <= 19; i++)
    {
        gameboard[i][29] = grayTile;
    }
    for (int i = 0; i <= 29; i++)
    {
        gameboard[19][i] = grayTile;
    }
    for (int i = 12 + 1; i <= 29; i++)
    {
        gameboard[0][i] = grayTile;
    }
    for (int i = 12 + 2; i < 29; i++)
    {
        for (int j = 1; j < 19; j++)
        {
            gameboard[j][i] = solidGray;
        }
    }


    DMANow(3, &gameboard, &((screenblock *)0x6000000)[15], 1024);
}

void updateGame()
{
    if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1)))))
    {
        rotatePiecesCW();
    }
    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0)))))
    {
        rotatePiecesCCW();
    }
    updatePieces();
    checkForRowClear();


    if ((!(~(oldButtons)&((1<<5))) && (~buttons & ((1<<5)))))
    {
        if (checkForCollision((currentTetreminoType * 4) + currentTetreminoRotation, currentTetreminoCol - 1, currentTetreminoRow) == 0 && currentTetreminoCol - 1 >= 0)
        {
            currentTetreminoCol--;
        }
    }
    if ((!(~(oldButtons)&((1<<4))) && (~buttons & ((1<<4)))))
    {
        if (checkForCollision((currentTetreminoType * 4) + currentTetreminoRotation, currentTetreminoCol + 1, currentTetreminoRow) == 0)
        {
            currentTetreminoCol++;
        }
    }
}

void drawGame()
{
    updatePieceSprites();
    int oamIndex = 80;


    for (int i = 0; i < 5; i++)
    {
        shadowOAM[oamIndex].attr0 = (40 + 8 * i) | (0<<13) | (0<<14);
        shadowOAM[oamIndex].attr1 = 160 | (0<<14);
        shadowOAM[oamIndex].attr2 = ((0)*32+(3));
        oamIndex++;
    }
    for (int i = 0; i < 3; i++)
    {
        shadowOAM[oamIndex].attr0 = 40 | (0<<13) | (0<<14);
        shadowOAM[oamIndex].attr1 = (160 + 8 * i) | (0<<14);
        shadowOAM[oamIndex].attr2 = ((0)*32+(3));
        oamIndex++;
    }
    for (int i = 0; i < 3; i++)
    {
        shadowOAM[oamIndex].attr0 = 56 | (0<<13) | (0<<14);
        shadowOAM[oamIndex].attr1 = (160 + 8 * i) | (0<<14);
        shadowOAM[oamIndex].attr2 = ((0)*32+(3));
        oamIndex++;
    }
    for (int i = 0; i < 3; i++)
    {
        shadowOAM[oamIndex].attr0 = 72 | (0<<13) | (0<<14);
        shadowOAM[oamIndex].attr1 = (160 + 8 * i) | (0<<14);
        shadowOAM[oamIndex].attr2 = ((0)*32+(3));
        oamIndex++;
    }

    DMANow(3, &shadowOAM, ((OBJ_ATTR*)(0x7000000)), 512);
}
