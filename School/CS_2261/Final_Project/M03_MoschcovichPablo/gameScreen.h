
//{{BLOCK(gameScreen)

//======================================================================
//
//	gameScreen, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 34 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 1088 + 4096 = 5696
//
//	Time-stamp: 2022-04-09, 20:19:48
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMESCREEN_H
#define GRIT_GAMESCREEN_H

#define gameScreenTilesLen 1088
extern const unsigned short gameScreenTiles[544];

#define gameScreenMapLen 4096
extern const unsigned short gameScreenMap[2048];

#define gameScreenPalLen 512
extern const unsigned short gameScreenPal[256];

#endif // GRIT_GAMESCREEN_H

//}}BLOCK(gameScreen)
