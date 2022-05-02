
enum
{
    NORMAL,
    BOSS,
    SPECIAL,
    ICE,
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
    int shot2;
    int shotFramesEnemy;
    int hitFramesEnemy;
    int x;
    int xLimit;
    int rowDirection;
} ANISPRITE;

#define COINCOUNT 12
#define AMMOCOUNT 15
#define WEAPONCOUNT 3
#define ENEMYCOUNT 12
#define BULLETCOUNT 5
#define ENEMYBULLETCOUNT 30
#define MAPWIDTH 1024
#define MAPHEIGHT 256
ANISPRITE player;
ANISPRITE key;
ANISPRITE door;
ANISPRITE enemy[ENEMYCOUNT];
ANISPRITE coin[COINCOUNT];
ANISPRITE ammo[AMMOCOUNT];
ANISPRITE weapon[WEAPONCOUNT];
ANISPRITE bullets[BULLETCOUNT];
ANISPRITE enemyBullets[ENEMYBULLETCOUNT];