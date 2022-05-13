
//{{BLOCK(instructionsScreen)

//======================================================================
//
//	instructionsScreen, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 423 tiles (t reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 27072 + 2048 = 29632
//
//	Time-stamp: 2022-04-29, 02:55:42
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONSSCREEN_H
#define GRIT_INSTRUCTIONSSCREEN_H

#define instructionsScreenTilesLen 27072
extern const unsigned short instructionsScreenTiles[13536];

#define instructionsScreenMapLen 2048
extern const unsigned short instructionsScreenMap[1024];

#define instructionsScreenPalLen 512
extern const unsigned short instructionsScreenPal[256];

#endif // GRIT_INSTRUCTIONSSCREEN_H

//}}BLOCK(instructionsScreen)
