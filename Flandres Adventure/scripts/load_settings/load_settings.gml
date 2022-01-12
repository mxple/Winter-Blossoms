// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_settings() {
	ini_open("settings.ini");
	global.KEY_LEFT =	ini_read_real("movement",	"KEY_LEFT",		vk_left);
	global.KEY_RIGHT =	ini_read_real("movement",	"KEY_RIGHT",	vk_right);
	global.KEY_UP =		ini_read_real("movement",	"KEY_UP",		vk_up);
	global.KEY_DOWN =	ini_read_real("movement",	"KEY_DOWN",		vk_down);
	global.KEY_JUMP =	ini_read_real("movement",	"KEY_JUMP",		ord("C"));
	global.KEY_ATTACK = ini_read_real("movement",	"KEY_ATTACK",	ord("Z"));
	global.KEY_SPECIAL= ini_read_real("movement",	"KEY_SPECIAL",	ord("X"));
	set_view_size(ini_read_real("settings","resolution",1));
	ini_close();
}
