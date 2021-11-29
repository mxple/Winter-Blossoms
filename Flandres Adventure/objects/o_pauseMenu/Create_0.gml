/// @description menu items
global.PAUSE = true;

display_set_gui_size(VIEW_W, VIEW_H);

enum PMENU_ITEMS {
	MAIN,
	SETTINGS,
	AUDIO,
	GRAPHICS,
	CONTROLS,
	QUIT
}
/*
enum MENU_ELEMENT_TYPE{
	SCRIPT,
	TRANS,
	SLIDER,
	SHIFT,
	INPUT
}*/

//Create menu pages
ds_main_menu = create_menu_page(
	["RESUME",		MENU_ELEMENT_TYPE.SCRIPT,	pause_game],
	["SETTINGS",	MENU_ELEMENT_TYPE.TRANS,	PMENU_ITEMS.SETTINGS],	
	["QUIT",		MENU_ELEMENT_TYPE.SCRIPT,	save_game]
);

ds_settings = create_menu_page(
	["AUDIO",		MENU_ELEMENT_TYPE.TRANS,	PMENU_ITEMS.AUDIO],
	["GRAPHICS",	MENU_ELEMENT_TYPE.TRANS,	PMENU_ITEMS.GRAPHICS],
	["CONTROLS",	MENU_ELEMENT_TYPE.TRANS,	PMENU_ITEMS.CONTROLS],
	["BACK",		MENU_ELEMENT_TYPE.TRANS,	PMENU_ITEMS.MAIN]
);

ds_audio = create_menu_page(
	["MASTER",		MENU_ELEMENT_TYPE.SLIDER,	audio_master_gain,		1,		[0,1]],
	["BACK",		MENU_ELEMENT_TYPE.TRANS,	PMENU_ITEMS.SETTINGS]
);

ds_graphics = create_menu_page(
	["WINDOWED",	MENU_ELEMENT_TYPE.SHIFT,	window_set_fullscreen,	true,	[true,false]],
	["BACK",		MENU_ELEMENT_TYPE.TRANS,	PMENU_ITEMS.SETTINGS]
);

ds_controls = create_menu_page(
	["UP",			MENU_ELEMENT_TYPE.INPUT,	"KEY_UP",			vk_up],
	["DOWN",		MENU_ELEMENT_TYPE.INPUT,	"KEY_DOWN",			vk_down],
	["LEFT",		MENU_ELEMENT_TYPE.INPUT,	"KEY_LEFT",			vk_left],
	["RIGHT",		MENU_ELEMENT_TYPE.INPUT,	"KEY_RIGHT",		vk_right],
	["ATTACK",		MENU_ELEMENT_TYPE.INPUT,	"KEY_ATTACK",		ord("Z")],
	["JUMP",		MENU_ELEMENT_TYPE.INPUT,	"KEY_JUMP",			ord("C")],
	["SPECIAL",		MENU_ELEMENT_TYPE.INPUT,	"KEY_SPECIAL",		ord("X")],
	["BACK",		MENU_ELEMENT_TYPE.TRANS,	PMENU_ITEMS.SETTINGS]
);

page = 0;
menu_pages = [ds_main_menu, ds_settings, ds_audio, ds_graphics, ds_controls];

var i = 0, array_len = array_length_1d(menu_pages);
repeat(array_len) {
	menu_option[i]  = 0;
	i++;
}