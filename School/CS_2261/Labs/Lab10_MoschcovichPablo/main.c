#include "tetrisLib.h"
#include "tetreminos.h"
#include "game.h"
#include "main_menu.h"
#include "pause.h"
#include "win.h"
#include "lose.h"
#include "sound.h"
#include "gameSong.h"
#include "loseSong.h"
#include "winSong.h"
#include "startSong.h"

// TODO 1.1: Include your sound header files here

// Prototypes
void initialize();

// State Prototypes
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

// States
enum
{
    START,
    GAME,
    PAUSE,
    WIN,
    LOSE
};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Shadow OAM
OBJ_ATTR shadowOAM[128];

int main()
{
    initialize();

    while (1)
    {
        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
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

// Sets up GBA
void initialize()
{

    // Setup game tiles
    DMANow(3, tetreminosTiles, &CHARBLOCK[1], tetreminosTilesLen / 2);

    // Sprite pallete and tiles (same tiles and pallete as for game background)
    DMANow(3, tetreminosPal, SPRITEPALETTE, tetreminosPalLen / 2);
    DMANow(3, tetreminosTiles, &CHARBLOCK[4], tetreminosTilesLen / 2);

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_4BPP | BG_SIZE_SMALL;

    buttons = BUTTONS;
    oldButtons = 0;

    setupSounds();
    setupInterrupts();

    goToStart();
}

// Sets up the start state
void goToStart()
{
    state = START;

    // TODO 4.4: Uncomment this line
    playSoundA(startSong_data, startSong_length, 1);

    REG_DISPCTL = MODE0 | BG0_ENABLE; // Disable sprites while in menus
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(7) | BG_4BPP | BG_SIZE_SMALL;

    // Setup main menu background
    DMANow(3, main_menuPal, PALETTE, main_menuPalLen / 2);
    DMANow(3, main_menuTiles, &CHARBLOCK[0], main_menuTilesLen / 2);
    DMANow(3, main_menuMap, &SCREENBLOCK[7], main_menuMapLen / 2);
}

int seed = 0;

// Runs every frame of the start state
void start()
{
    seed++;
    if (BUTTON_PRESSED(BUTTON_START) || BUTTON_PRESSED(BUTTON_SELECT))
    {
        setupGameboard(); // We only want this called when starting a new game from the main menu, so we call it here
        goToGame();

        // TODO 5.1: Play the gameSong when the player transitions to the game state
        stopSound();
        playSoundA(gameSong_data, gameSong_length, 1);
    }
}

// Sets up the game state
void goToGame()
{
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;                            // Enable sprites
    REG_BG0CNT = BG_CHARBLOCK(1) | BG_SCREENBLOCK(15) | BG_4BPP | BG_SIZE_SMALL; // We use CB1 and SB15 for in-game
    DMANow(3, tetreminosPal, PALETTE, tetreminosPalLen / 2);                     // Switch to game palette

    srand(seed);
    state = GAME;
    startGame();
}

// Runs every frame of the game state
void game()
{
    if (BUTTON_PRESSED(BUTTON_START))
    {
        goToPause();

        // TODO 5.2: Pause sound when going to the pause state
        pauseSound();
    }

    // **HELPFUL TESTING FEATURES IF TETRIS IS HARD**
    if (BUTTON_PRESSED(BUTTON_SELECT))
    {
        // Play the row clear sound here
    }
    if (BUTTON_PRESSED(BUTTON_R))
    {
        goToWin();
    }
    if (BUTTON_PRESSED(BUTTON_L))
    {
        goToLose();
    }

    updateGame();
    waitForVBlank();
    drawGame();
}

// Sets up the pause state
void goToPause()
{
    state = PAUSE;

    REG_DISPCTL = MODE0 | BG0_ENABLE; // Disable sprites while in menus

    // Setup pause background
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(7) | BG_4BPP | BG_SIZE_SMALL;
    DMANow(3, pausePal, PALETTE, pausePalLen / 2);
    DMANow(3, pauseTiles, &CHARBLOCK[0], pauseTilesLen / 2);
    DMANow(3, pauseMap, &SCREENBLOCK[7], pauseMapLen / 2);
}

// Runs every frame of the pause state
void pause()
{
    if (BUTTON_PRESSED(BUTTON_START))
    {
        goToGame();

        // TODO 5.2: Unpause sound when going back to game state
        unpauseSound();
    }
}

// Sets up the win state
void goToWin()
{
    state = WIN;

    REG_DISPCTL = MODE0 | BG0_ENABLE; // Disable sprites while in menus

    // Setup win background
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(7) | BG_4BPP | BG_SIZE_SMALL;
    DMANow(3, winPal, PALETTE, winPalLen / 2);
    DMANow(3, winTiles, &CHARBLOCK[0], winTilesLen / 2);
    DMANow(3, winMap, &SCREENBLOCK[7], winMapLen / 2);

    // TODO 5.3: Play the winSong when the player transitions to the win state
    stopSound();
    playSoundA(winSong_data, winSong_length, 1);
}

// Runs every frame of the win state
void win()
{
    if (BUTTON_PRESSED(BUTTON_START))
    {
        goToStart();
    }
}

// Sets up the lose state
void goToLose()
{
    state = LOSE;

    REG_DISPCTL = MODE0 | BG0_ENABLE; // Disable sprites while in menus

    // Setup lose background
    REG_BG0CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(7) | BG_4BPP | BG_SIZE_SMALL;

    DMANow(3, losePal, PALETTE, losePalLen / 2);
    DMANow(3, loseTiles, &CHARBLOCK[0], loseTilesLen / 2);
    DMANow(3, loseMap, &SCREENBLOCK[7], loseMapLen / 2);

    // TODO 5.3: Play the loseSong when the player transitions to the lose state
    stopSound();
    playSoundA(loseSong_data, loseSong_length, 1);
}

// Runs every frame of the lose state
void lose()
{
    if (BUTTON_PRESSED(BUTTON_START))
    {
        goToStart();
    }
}