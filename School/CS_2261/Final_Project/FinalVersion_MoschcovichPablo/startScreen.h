
//{{BLOCK(startScreen)

//======================================================================
//
//	startScreen, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 234 tiles (t reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 14976 + 2048 = 17536
//
//	Time-stamp: 2022-04-28, 23:36:23
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_STARTSCREEN_H
#define GRIT_STARTSCREEN_H

#define startScreenTilesLen 14976
extern const unsigned short startScreenTiles[7488];

#define startScreenMapLen 2048
extern const unsigned short startScreenMap[1024];

#define startScreenPalLen 512
extern const unsigned short startScreenPal[256];

#endif // GRIT_STARTSCREEN_H

//}}BLOCK(startScreen)
