
//{{BLOCK(win)

//======================================================================
//
//	win, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 63 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2016 + 2048 = 4576
//
//	Time-stamp: 2022-03-09, 01:54:48
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WIN_H
#define GRIT_WIN_H

#define winTilesLen 2016
extern const unsigned short winTiles[1008];

#define winMapLen 2048
extern const unsigned short winMap[1024];

#define winPalLen 512
extern const unsigned short winPal[256];

#endif // GRIT_WIN_H

//}}BLOCK(win)
