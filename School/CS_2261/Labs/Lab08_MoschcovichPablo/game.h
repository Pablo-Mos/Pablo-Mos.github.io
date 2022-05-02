// Constants
#define MAPHEIGHT 256
#define MAPWIDTH 256

// Variables
extern int hOff;
extern int vOff;
extern OBJ_ATTR shadowOAM[128];
extern SPRITE pikachu;

// Prototypes
void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();

// Collision function prototypes
int collisionCheck(unsigned char *collisionMap, int mapWidth, int col, int row, int width, int height, 
        int colShift, int rowShift);
int collisionCheckAllPixels(unsigned char *collisionMap, int mapWidth, int col, int row, int width, 
        int height, int colShift, int rowShift);
int collisionCheckReturnLargest(unsigned char *collisionMap, int mapWidth, int col, int row, int width, 
    int height, int colShift, int rowShift);
int collisionCheckReturnLargestAllPixels(unsigned char *collisionMap, int mapWidth, int col, int row, 
        int width, int height, int colShift, int rowShift);