
//{{BLOCK(pauseScreen)

//======================================================================
//
//	pauseScreen, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 197 tiles (t reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 12608 + 2048 = 15168
//
//	Time-stamp: 2022-04-28, 23:34:35
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSESCREEN_H
#define GRIT_PAUSESCREEN_H

#define pauseScreenTilesLen 12608
extern const unsigned short pauseScreenTiles[6304];

#define pauseScreenMapLen 2048
extern const unsigned short pauseScreenMap[1024];

#define pauseScreenPalLen 512
extern const unsigned short pauseScreenPal[256];

#endif // GRIT_PAUSESCREEN_H

//}}BLOCK(pauseScreen)
