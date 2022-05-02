
//{{BLOCK(foreground)

//======================================================================
//
//	foreground, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 20 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 640 + 2048 = 3200
//
//	Time-stamp: 2022-03-17, 13:54:41
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_FOREGROUND_H
#define GRIT_FOREGROUND_H

#define foregroundTilesLen 640
extern const unsigned short foregroundTiles[320];

#define foregroundMapLen 2048
extern const unsigned short foregroundMap[1024];

#define foregroundPalLen 512
extern const unsigned short foregroundPal[256];

#endif // GRIT_FOREGROUND_H

//}}BLOCK(foreground)
