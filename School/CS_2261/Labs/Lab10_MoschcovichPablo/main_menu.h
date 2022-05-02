
//{{BLOCK(main_menu)

//======================================================================
//
//	main_menu, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 357 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 11424 + 2048 = 13984
//
//	Time-stamp: 2021-03-21, 01:56:57
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_MAIN_MENU_H
#define GRIT_MAIN_MENU_H

#define main_menuTilesLen 11424
extern const unsigned short main_menuTiles[5712];

#define main_menuMapLen 2048
extern const unsigned short main_menuMap[1024];

#define main_menuPalLen 512
extern const unsigned short main_menuPal[256];

#endif // GRIT_MAIN_MENU_H

//}}BLOCK(main_menu)
