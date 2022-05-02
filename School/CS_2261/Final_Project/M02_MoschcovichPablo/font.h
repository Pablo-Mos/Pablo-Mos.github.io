
//{{BLOCK(font)

//======================================================================
//
//	font, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 79 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 2528 + 2048 = 5088
//
//	Time-stamp: 2022-03-17, 10:12:03
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_FONT_H
#define GRIT_FONT_H

#define fontTilesLen 2528
extern const unsigned short fontTiles[1264];

#define fontMapLen 2048
extern const unsigned short fontMap[1024];

#define fontPalLen 512
extern const unsigned short fontPal[256];

#endif // GRIT_FONT_H

//}}BLOCK(font)
