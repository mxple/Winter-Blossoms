/// @description 
pause = false;
pause_surf = -1;
surf_buffer = -1;

w = 0;
h = 0;

gray = make_color_rgb(128,128,128);


enum PMENU_ITEMS {
	PAUSE,
	SETTINGS,
	AUDIO,
	GRAPHICS,
	CONTROLS
}

invalidKeys = [vk_enter, vk_escape, vk_backspace, vk_control, vk_alt, vk_lcontrol, vk_lalt];

//MENU
ds_pause_menu = create_menu_page(
	["RESUME",			MENU_ELEMENT_TYPE.SCRIPT,	resume],
	["SETTINGS",		MENU_ELEMENT_TYPE.TRANS,	PMENU_ITEMS.SETTINGS],	
	["QUICK SAVE",		MENU_ELEMENT_TYPE.SCRIPT,	save_data],
	["SAVE AND QUIT",	MENU_ELEMENT_TYPE.SCRIPT,	save_and_quit]
);

ds_settings = create_menu_page(
	["Audio",		MENU_ELEMENT_TYPE.TRANS,	PMENU_ITEMS.AUDIO],
	["Graphics",	MENU_ELEMENT_TYPE.TRANS,	PMENU_ITEMS.GRAPHICS],
	["Controls",	MENU_ELEMENT_TYPE.TRANS,	PMENU_ITEMS.CONTROLS],
	["Back",		MENU_ELEMENT_TYPE.TRANS,	PMENU_ITEMS.PAUSE]
);

ds_audio = create_menu_page(
	["Master",		MENU_ELEMENT_TYPE.SLIDER,	audio_master_gain,		1,		[0,1]],
	["Back",		MENU_ELEMENT_TYPE.TRANS,	PMENU_ITEMS.SETTINGS]
);

ds_graphics = create_menu_page(
	["Resolution",	MENU_ELEMENT_TYPE.SHIFT,	set_view_size,			1,		["640X360","1280x720","1920x1080","2560X1440"]],
	["Fullscreen",	MENU_ELEMENT_TYPE.TOGGLE,	window_set_fullscreen,	0,		["WINDOWED","FULLSCREEN"]],
	["Back",		MENU_ELEMENT_TYPE.TRANS,	PMENU_ITEMS.SETTINGS]
);

ds_controls = create_menu_page(
	["Up",			MENU_ELEMENT_TYPE.INPUT,	"KEY_UP",				vk_up],
	["Down",		MENU_ELEMENT_TYPE.INPUT,	"KEY_DOWN",				vk_down],
	["Left",		MENU_ELEMENT_TYPE.INPUT,	"KEY_LEFT",				vk_left],
	["Right",		MENU_ELEMENT_TYPE.INPUT,	"KEY_RIGHT",			vk_right],
	["Attack",		MENU_ELEMENT_TYPE.INPUT,	"KEY_ATTACK",			ord("Z")],
	["Jump",		MENU_ELEMENT_TYPE.INPUT,	"KEY_JUMP",				ord("C")],
	["Special",		MENU_ELEMENT_TYPE.INPUT,	"KEY_SPECIAL",			ord("X")],
	["Back",		MENU_ELEMENT_TYPE.TRANS,	PMENU_ITEMS.SETTINGS]
);

page = 0;
menu_pages = [ds_pause_menu, ds_settings, ds_audio, ds_graphics, ds_controls];

var i = 0, array_len = array_length_1d(menu_pages);
repeat(array_len) {
	menu_option[i] = 0;
	i++;
}
inputting = false;