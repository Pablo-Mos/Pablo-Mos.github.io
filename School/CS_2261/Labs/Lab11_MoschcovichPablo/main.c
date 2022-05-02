#include <stdlib.h>
#include <stdio.h>
#include "mode0.h"
#include "list.h"
#include "tiles.h"
#include "spritesheet.h"

void initialize();
int rand();
void update();
void draw();

unsigned short buttons;
unsigned short oldButtons;

OBJ_ATTR shadowOAM[128];

LIST *snakeList;

#define FRAMES_BETWEEN_MOVEMENT 10
#define SNAKE_TILE_ID 1
#define FOOD_TILE_ID 1

enum {UP, RIGHT, DOWN, LEFT};
int direction;

int skipFrames;

enum {GAME, LOSE};
int state = GAME;

#define FOOD_COUNT 1

typedef struct food {
    int tileCol;
    int tileRow;
    int active;
} FOOD;

FOOD food[FOOD_COUNT];

int main() {
    initialize();

    while (1) {
        switch (state) {
            case GAME:
                update();
                waitForVBlank();
                draw();
                break;
            case LOSE:
                if (BUTTON_PRESSED(BUTTON_START)) {
                    initialize();
                }
        }

        oldButtons = buttons;
		buttons = BUTTONS;
    }
}

void initialize() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    state = GAME;

    DMANow(3, &tilesTiles, &CHARBLOCK[0], tilesTilesLen / 2);
    DMANow(3, &tilesPal, PALETTE, tilesPalLen / 2);

    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);

    buttons = BUTTONS;
    oldButtons = 0;

    // Initialize our snake with 5 nodes lined up horizontally
    snakeList = create_list();
    push_front(snakeList, (POSITION) {.col = 20, .row = 10});
    push_front(snakeList, (POSITION) {.col = 19, .row = 10});
    push_front(snakeList, (POSITION) {.col = 18, .row = 10});
    push_front(snakeList, (POSITION) {.col = 17, .row = 10});
    push_front(snakeList, (POSITION) {.col = 16, .row = 10});

    direction = LEFT;

    spawnFood();
}

void update() {
    if (BUTTON_PRESSED(BUTTON_LEFT)) {
        direction = LEFT;
    }
    if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        direction = RIGHT;
    }
    if (BUTTON_PRESSED(BUTTON_UP)) {
        direction = UP;
    }
    if (BUTTON_PRESSED(BUTTON_DOWN)) {
        direction = DOWN;
    }

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        push_back(snakeList, snakeList->tail->pos);
    }

    // Move the snake
    skipFrames++;
    if (skipFrames >= FRAMES_BETWEEN_MOVEMENT) {
        skipFrames = 0;
        updateNodePositions(snakeList);
        switch (direction) {
            case UP:
                snakeList->head->pos.row--;
                break;
            case RIGHT:
                snakeList->head->pos.col++;
                break;
            case DOWN:
                snakeList->head->pos.row++;
                break;
            case LEFT:
                snakeList->head->pos.col--;
                break;
        }

        checkForFood();
        checkForLose();
    }
}

void checkForLose() {
    POSITION pos = snakeList->head->pos;

    if (pos.col < 0 || pos.col > 31 || pos.row < 0 || pos.row > 19 || 
            SCREENBLOCK[31].tilemap[OFFSET(pos.col, pos.row, 32)] == SNAKE_TILE_ID) {
        
        u16 one = SNAKE_TILE_ID;
        DMANow(3, &one, &SCREENBLOCK[31], 1024 | DMA_SOURCE_FIXED);
        state = LOSE;
    }
}

void checkForFood() {
    POSITION pos = snakeList->head->pos;

    for (int i = 0; i < FOOD_COUNT; i++) {
        if (food[i].tileCol == pos.col && food[i].tileRow == pos.row) {
            food[i].active = 0;
            push_back(snakeList, snakeList->tail->pos);
            spawnFood();
        }
    }
}

void spawnFood() {
    for (int i = 0; i < FOOD_COUNT; i++) {
        if (!food[i].active) {
            food[i].tileCol = rand() % 30;
            food[i].tileRow = rand() % 20;
            food[i].active = 1;
        }
    }
}

void draw() {
    if (state == GAME) {
        u16 zero = 0;
        DMANow(3, &zero, &SCREENBLOCK[31], 1024 | DMA_SOURCE_FIXED);

        NODE *curr = snakeList->head;
        while (curr != NULL) {
            SCREENBLOCK[31].tilemap[OFFSET(curr->pos.col, curr->pos.row, 32)] = 1;
            curr = curr->next;
        }

        for (int i = 0; i < FOOD_COUNT; i++) {
            shadowOAM[i].attr0 = food[i].tileRow * 8;
            shadowOAM[i].attr1 = food[i].tileCol * 8;
            shadowOAM[i].attr2 = FOOD_TILE_ID;
        }
        DMANow(3, shadowOAM, OAM, 512);
    }
}