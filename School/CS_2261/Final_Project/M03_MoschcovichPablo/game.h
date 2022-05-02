
enum
{
    NORMAL,
    BOSS,
    SPECIAL,
    GUN,
    KNIFE,
    SHIELD
};

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
    int active;
    int bulletTimer;
    int direction;
    int type;
    int health;
    int shot;
    int x;
    int xLimit;
    int rowDirection;
} ANISPRITE;

#define COINCOUNT 3
#define AMMOCOUNT 5
#define WEAPONCOUNT 3
#define ENEMYCOUNT 3
#define BULLETCOUNT 5
#define ENEMYBULLETCOUNT 30
#define MAPWIDTH 512
#define MAPHEIGHT 256
ANISPRITE player;
ANISPRITE enemy[ENEMYCOUNT];
ANISPRITE coin[COINCOUNT];
ANISPRITE ammo[AMMOCOUNT];
ANISPRITE weapon[WEAPONCOUNT];
ANISPRITE bullets[BULLETCOUNT];
ANISPRITE enemyBullets[ENEMYBULLETCOUNT];