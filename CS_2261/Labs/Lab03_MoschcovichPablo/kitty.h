#define KITTYLEN 16
#define KITTYCOUNT 5

// kitty struct
typedef struct {
	int* bitmap;
	unsigned short furColor;
} KITTY;

extern KITTY kitties[KITTYCOUNT];
extern int kittyBitmaps[KITTYCOUNT];

// prototypes
void initializeKitties();
void drawKitty(KITTY* kitty_ptr, int index);

