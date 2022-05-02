// DONE: Prison background (XL, mostly working) in game (will be more complete w/art), better artistic background in PAUSE state,
//      new sprites for all characters/objects, menu music, game music (must be paused/unpaused before hearing), player hurt sound effect,
//      tile change when player shoots up at key-box (top right of map) the box breaks/removes blocking-tile and allows key to fall,
//      hardware timer in game, win by collecting key and walking to door (bottom right of map)
//
//      Working state machine, collision map for player to move around correctly, player movement (horizontal and jumping),
//      player actions (block, stab, shoot), weapon/item rotation, bullet movement for enemy and player, ability to collect coins,
//      weapons/items, and ammo, ability to kill enemies with bullets/stabbing(if nearby), ability to get hurt by enemy
//      (if contact with enemy or their bullets)(waits to lose another life if player remains touching enemy), lose if no lives left,
//      win by get points (gained through killing enemies and getting coins)
//
// WILL BE ADDED: Actual backgrounds for different states with cohesive theme, updated UI for top corners (showing lives, points, etc.),
//      improve collisions, fix spritesheet layout, make better animations for player actions, add music
//
// BUGS: duplicate sprites (so right now, only sprites at start of map to make playable), sound issues (gameSong starts only after game pause, although setup just like lab),
//       sometimes player can get stuck between platform, if not on first screen block, pausing causes screenblock to reset when unpause,
//
//
// HOW TO PLAY:
//     BUTTON CONTROLS:
//          LEFT: move player left
//          RIGHT: move player right
//          UP: aim bullet upward once shot
//          DOWN: aim bullet downward once shot
//          START: go to pause screen
//          SELECT: switch weapons (amongst available)
//          B: make player jump
//          A: use weapon/item equipped
//              -shield: block/destroy enemy bullets (can hold button for this item action only)
//              -knife: stab nearby enemy
//              -gun: shoot bullet (hold UP to shoot up) (if shot horizontally, can hold UP or DOWN to move bullet shot after release)
//      Instructions:
//          Move through map to get weapons and other items. Avoid collision with enemies and their bullets (causes loss of life). Gain points
//          by collecting coins (special coin awards a life and 4 bonus points) and killing enemies (boss requires 4 hits to kill, rest need only 2).
//          Collect ammo to use with gun by finding different ammo packets (have 5 bullets). Get key by shooting up at box in top-right corner of map.
//          Win game by going to door AFTER collecting the key. Swap weapon/item equipped to use different actions (block, stab, shoot). Lose game by losing all lives.
//
#include <stdlib.h>
#include <stdio.h>
#include "mode0.h"
#include "game.h"
#include "bg.h"
#include "gameScreen.h"
#include "gameScreen2.h"
#include "instructions.h"
#include "pause.h"
#include "win.h"
#include "lose.h"
#include "spritesheet.h"
#include "font.h"
#include "collisionMap.h"
#include "startSong.h"
#include "gameSong.h"
#include "sound.h"

// Prototypes.
void initialize();

// State Prototypes.
void goToStart();
void start();
void goToInstructions();
void instructions();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States.
enum
{
    START,
    INSTRUCTIONS,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;
int seed;
int won;
int lives;
int pts;
int currWeapon;
int numWeapons;
int numBullets;
int screenBlock;
int time_m;
int time_s;

// Button Variables.
unsigned short buttons;
unsigned short oldButtons;

int hOff = 0;
int vOff = 0;

// Shadow OAM.
OBJ_ATTR shadowOAM[128];

int main()
{
    setupSounds();
    setupInterrupts();

    initialize();

    while (1)
    {
        // Update button variables.
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine.
        switch (state)
        {
        case START:
            start();
            break;
        case INSTRUCTIONS:
            instructions();
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

// Sets up GBA.
void initialize()
{
    playSoundA(startSong_data, startSong_length, 1);

    screenBlock = 28;
    buttons = BUTTONS;
    oldButtons = 0;
    goToStart();
}

// Sets up the start state.
void goToStart()
{

    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    DMANow(3, bgPal, PALETTE, 256);
    DMANow(3, bgTiles, &CHARBLOCK[0], bgTilesLen / 2);
    DMANow(3, bgMap, &SCREENBLOCK[28], bgMapLen / 2);

    buttons = BUTTONS;
    state = START;
    seed = 0;
    lives = 3;
    pts = 0;
    won = 0;
}

// Runs every frame of the start state.
void start()
{
    seed++;
    if (BUTTON_PRESSED(BUTTON_START))
    {
        srand(seed);
        screenBlock = 28;
        goToGame();
        // sound
        // pauseSound();
        stopSound();
        // unpauseSound();
        playSoundA(gameSong_data, gameSong_length, 1);
        //
        initGame();
        // restart timer when go to start screen (won't actually count until game state initialized)
        REG_TM0CNT = TIMER_OFF;
        REG_TM1CNT = TIMER_OFF;
        time_m = 0;
        time_s = 0;
        REG_TM0CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;
        REG_TM1CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;
    }
    if (BUTTON_PRESSED(BUTTON_SELECT))
    {
        goToInstructions();
    }
}

// Sets up the game state.
void goToInstructions()
{
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    DMANow(3, instructionsPal, PALETTE, 256);
    DMANow(3, instructionsTiles, &CHARBLOCK[0], instructionsTilesLen / 2);
    DMANow(3, instructionsMap, &SCREENBLOCK[28], instructionsMapLen / 2);
    hideSprites();
    waitForVBlank();
    state = INSTRUCTIONS;
}

// Runs every frame of the instructions state.
void instructions()
{
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_SELECT))
    {
        goToStart();
    }
}

// Sets up the game state.
void goToGame()
{
    // resume timer
    REG_TM0CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;
    REG_TM1CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;

    REG_BG0CNT = BG_4BPP | BG_SIZE_WIDE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);

    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;

    REG_DISPCTL = MODE0 | BG0_ENABLE | BG2_ENABLE | SPRITE_ENABLE;

    DMANow(3, gameScreenPal, PALETTE, 256);
    DMANow(3, gameScreenTiles, &CHARBLOCK[0], gameScreenTilesLen / 2);
    DMANow(3, gameScreenMap, &SCREENBLOCK[28], gameScreenMapLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    hideSprites();
    waitForVBlank();
    state = GAME;
}

// Runs every frame of the game state.
void game()
{
    if (hOff > 256 && screenBlock < 30)
    {
        screenBlock++;
        hOff -= 256;
        REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(screenBlock) | BG_SIZE_WIDE | BG_4BPP;
    }
    else if (hOff < 0 && screenBlock > 28)
    {
        screenBlock--;
        hOff += 256;
        REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(screenBlock) | BG_SIZE_WIDE | BG_4BPP;
    }

    ///////
    REG_BG0VOFF = vOff;
    REG_BG0HOFF = hOff;
    REG_BG2HOFF = 2 * hOff;

    showLives();
    showTime();
    updateGame();
    showScore();
    showAmmo();
    showWeapons();
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    if (BUTTON_PRESSED(BUTTON_START))
    {
        goToPause();
        pauseSound();
    }
    if (won)
    {
        goToWin();
    }
    if (lives <= 0 || time_m >= 5)
    {
        goToLose();
    }
}

// Sets up the pause state.
void goToPause()
{
    REG_TM0CNT = TIMER_OFF;
    REG_TM1CNT = TIMER_OFF;

    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    DMANow(3, pausePal, PALETTE, 256);
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen / 2);
    DMANow(3, pauseMap, &SCREENBLOCK[28], pauseMapLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();
    state = PAUSE;
}

// Runs every frame of the pause state.
void pause()
{
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
    {
        goToGame();
        unpauseSound();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT))
    {
        goToStart();
        stopSound();
        playSoundA(startSong_data, startSong_length, 1);
    }
}

// Sets up the win state.
void goToWin()
{
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    DMANow(3, winPal, PALETTE, 256);
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen / 2);
    DMANow(3, winMap, &SCREENBLOCK[28], winMapLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();
    state = WIN;
}

// Runs every frame of the win state.
void win()
{
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
    {
        goToStart();
        stopSound();
        playSoundA(startSong_data, startSong_length, 1);
    }
}

// Sets up the lose state.
void goToLose()
{
    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    DMANow(3, losePal, PALETTE, 256);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[28], loseMapLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    waitForVBlank();
    state = LOSE;
}

// Runs every frame of the lose state.
void lose()
{
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START))
    {
        goToStart();
        stopSound();
        playSoundA(startSong_data, startSong_length, 1);
    }
}

void showLives()
{
    shadowOAM[1].attr0 = 2 | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[1].attr1 = SCREENWIDTH - 70 | ATTR1_LARGE;
    shadowOAM[1].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, (lives - 1) * 4 + 8);
}

void showScore()
{
    shadowOAM[2].attr0 = 2 | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[2].attr1 = SCREENWIDTH - 70 | ATTR1_LARGE;
    shadowOAM[2].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 22);

    shadowOAM[3].attr0 = 17 | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[3].attr1 = SCREENWIDTH - 28 | ATTR1_TINY;
    if (pts < 10)
        shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * pts);
    else
    {
        shadowOAM[3].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * (pts / 10));
        shadowOAM[4].attr0 = 17 | ATTR0_4BPP | ATTR0_TALL;
        shadowOAM[4].attr1 = SCREENWIDTH - 20 | ATTR1_TINY;
        shadowOAM[4].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * (pts % 10));
    }
}

void showAmmo()
{
    shadowOAM[5].attr0 = 4 | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[5].attr1 = 8 | ATTR1_LARGE;
    shadowOAM[5].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 20);

    shadowOAM[6].attr0 = 4 | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[6].attr1 = 48 | ATTR1_TINY;
    if (numBullets < 10)
    {
        shadowOAM[6].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * numBullets);
        shadowOAM[7].attr0 = ATTR0_HIDE;
    }
    else
    {
        shadowOAM[6].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * (numBullets / 10));
        shadowOAM[7].attr0 = 4 | ATTR0_4BPP | ATTR0_TALL;
        shadowOAM[7].attr1 = 56 | ATTR1_TINY;
        shadowOAM[7].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * (numBullets % 10));
    }
}

void showWeapons()
{
    shadowOAM[8].attr0 = 18 | ATTR0_4BPP | ATTR0_WIDE;
    shadowOAM[8].attr1 = 7 | ATTR1_LARGE;
    shadowOAM[8].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(20, 28);
    if (numWeapons > 0) // possibly remove this line when implement different UI for weapons
    {
        shadowOAM[9].attr0 = 17 | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[9].attr1 = 56 | ATTR1_TINY;
        if (currWeapon == SHIELD)
            shadowOAM[9].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(23, 2);
        else if (currWeapon == KNIFE)
            shadowOAM[9].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(24, 2);
        else if (currWeapon == GUN)
            shadowOAM[9].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(25, 2);
    }
}

void showTime()
{
    short time_m_1s = time_m % 10;
    short time_s_1s = time_s % 10;
    short time_s_10s = time_s / 10;

    char y = 145;
    char x = 8;
    shadowOAM[10].attr0 = y | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[10].attr1 = x - 4 | ATTR1_SMALL;
    shadowOAM[10].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(26, 2);

    shadowOAM[11].attr0 = y | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[11].attr1 = x + 8 | ATTR1_TINY;
    shadowOAM[11].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * time_m_1s);

    shadowOAM[12].attr0 = y | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[12].attr1 = x + 8 + 8 | ATTR1_TINY;
    shadowOAM[12].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 20);

    shadowOAM[13].attr0 = y | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[13].attr1 = x + 8 + 8 + 4 | ATTR1_TINY;
    shadowOAM[13].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * time_s_10s);

    shadowOAM[14].attr0 = y | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[14].attr1 = x + 8 + 8 + 8 + 4 | ATTR1_TINY;
    shadowOAM[14].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(28, 2 * time_s_1s);
}

// void interruptHandler(void)
// {
//     REG_IME = 0;

//     if (REG_IF & INT_TM1)
//     {
//         time_s++;
//         if (time_s > 59)
//         {
//             time_s = time_s - 60;
//             time_m++;
//         }
//     }

//     if (REG_IF & INT_VBLANK)
//     {
//         showTime();
//         DMANow(3, shadowOAM, OAM, 512);
//     }

//     REG_IF = REG_IF;
//     REG_IME = 1;
// }

// dont use
//  void setupInterrupts(void)
//  {
//      REG_IME = 0;
//      REG_INTERRUPT = (unsigned int)interruptHandler;
//      enableTimerInterrupts();
//      REG_IE |= INT_VBLANK;
//      REG_DISPSTAT |= INT_VBLANK_ENABLE;
//      REG_IME = 1;
//  }

// void enableTimerInterrupts(void)
// {
//     REG_IE = INT_TM0 | INT_TM1;
//     REG_TM0CNT = 0;
//     REG_TM0D = 65536 - 164;
//     REG_TM0CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;
//     REG_TM1CNT = 0;
//     REG_TM1D = 65536 - 16384;
//     REG_TM1CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;
// }