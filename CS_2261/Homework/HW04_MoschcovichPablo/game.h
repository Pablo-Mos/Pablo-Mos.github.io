// player struct
typedef struct {
    int col;
    int row;
    int width;
    int height;
    int cdel;
    int rdel;
    int bulletTimer;
} PLAYER;

// bullet struct
typedef struct {
    int col;
    int row;
    int width;
    int height;
    int cdel;
    int rdel;
    int active;
    unsigned short color;
} BULLET;

// enemy struct
typedef struct {
    int col;
    int row;
    int width;
    int height;
    int cdel;
    int rdel;
    int active;
} ENEMY;

// constants
#define BULLETCOUNT 8
#define ENEMYCOUNT 5

// variables
extern PLAYER player;
extern BULLET bullets[BULLETCOUNT];
extern ENEMY enemies[ENEMYCOUNT];
extern int enemiesRemaining;
extern int gameState;

// custom game colors
#define NUMCOLORS 6
enum {BLACKID=(256-NUMCOLORS), BLUEID, GREENID, REDID, WHITEID, GRAYID};
extern unsigned short colors[NUMCOLORS];

// game prototypes
void initGame();
void updateGame();
void drawGame();

// player prototypes
void initPlayer();
void updatePlayer();
void drawPlayer();

// bullet prototypes
void initBullets();
void fireBullet();
void updateBullet(BULLET *);
void drawBullet(BULLET *);

// enemy prototypes
void initEnemies();
void updateEnemy(ENEMY *);
void drawEnemy(ENEMY *);