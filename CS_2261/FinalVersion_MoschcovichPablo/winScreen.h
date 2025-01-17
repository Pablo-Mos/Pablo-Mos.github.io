
//{{BLOCK(winScreen)

//======================================================================
//
//	winScreen, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 168 tiles (t reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 10752 + 2048 = 13312
//
//	Time-stamp: 2022-04-29, 00:24:14
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINSCREEN_H
#define GRIT_WINSCREEN_H

#define winScreenTilesLen 10752
extern const unsigned short winScreenTiles[5376];

#define winScreenMapLen 2048
extern const unsigned short winScreenMap[1024];

#define winScreenPalLen 512
extern const unsigned short winScreenPal[256];

#endif // GRIT_WINSCREEN_H

//}}BLOCK(winScreen)
