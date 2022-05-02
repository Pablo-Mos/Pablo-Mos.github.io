
//{{BLOCK(gameBg)

//======================================================================
//
//	gameBg, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 116 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 3712 + 8192 = 12416
//
//	Time-stamp: 2022-03-08, 16:26:21
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEBG_H
#define GRIT_GAMEBG_H

#define gameBgTilesLen 3712
extern const unsigned short gameBgTiles[1856];

#define gameBgMapLen 8192
extern const unsigned short gameBgMap[4096];

#define gameBgPalLen 512
extern const unsigned short gameBgPal[256];

#endif // GRIT_GAMEBG_H

//}}BLOCK(gameBg)
