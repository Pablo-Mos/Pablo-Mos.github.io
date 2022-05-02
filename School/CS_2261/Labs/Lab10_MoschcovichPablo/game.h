// Prototypes
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

// These are measured in tiles
#define GAMEBOARD_WIDTH 12
#define GAMEBOARD_HEIGHT 19
#define SPAWN_TILE 3

#define SKIPFRAMES_BETWEEN_TETREMINO_MOVEMENT 10
#define LINES_CLEARED_TO_WIN 5
