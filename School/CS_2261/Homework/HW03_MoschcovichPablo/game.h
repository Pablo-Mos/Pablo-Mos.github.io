typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int cdel;
	int height;
	int width;
	unsigned short color;
} PLAYER;

typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int cdel;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
} WAVE;

typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
} FOOD;

//constants
#define WAVECOUNT 5
#define FOODCOUNT 15

//variables
extern PLAYER player;
extern WAVE waves[WAVECOUNT];
extern FOOD foods[FOODCOUNT];
extern int pts;

// Prototypes
void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void drawPlayer();

void initWaves();
void updateWave(WAVE *);
void drawWAVE(WAVE *);

void initFoods();
void updateFood(FOOD *);
void drawFood(FOOD *);