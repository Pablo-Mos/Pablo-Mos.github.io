
//{{BLOCK(gameScreen)

//======================================================================
//
//	gameScreen, 1024x256@4, 
//	+ palette 256 entries, not compressed
//	+ 255 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 128x32 
//	Total size: 512 + 8160 + 8192 = 16864
//
//	Time-stamp: 2022-04-23, 22:54:30
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMESCREEN_H
#define GRIT_GAMESCREEN_H

#define gameScreenTilesLen 8160
extern const unsigned short gameScreenTiles[4080];

#define gameScreenMapLen 8192
extern const unsigned short gameScreenMap[4096];

#define gameScreenPalLen 512
extern const unsigned short gameScreenPal[256];

#endif // GRIT_GAMESCREEN_H

//}}BLOCK(gameScreen)
