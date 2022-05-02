
//{{BLOCK(loseScreen)

//======================================================================
//
//	loseScreen, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 153 tiles (t reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 9792 + 2048 = 12352
//
//	Time-stamp: 2022-04-29, 00:23:49
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSESCREEN_H
#define GRIT_LOSESCREEN_H

#define loseScreenTilesLen 9792
extern const unsigned short loseScreenTiles[4896];

#define loseScreenMapLen 2048
extern const unsigned short loseScreenMap[1024];

#define loseScreenPalLen 512
extern const unsigned short loseScreenPal[256];

#endif // GRIT_LOSESCREEN_H

//}}BLOCK(loseScreen)
