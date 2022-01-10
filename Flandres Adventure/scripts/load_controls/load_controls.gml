// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_controls() {
	ini_open("controls.ini");
	global.KEY_LEFT =	ini_read_real("movement",	"KEY_LEFT",		global.KEY_LEFT);
	global.KEY_RIGHT =	ini_read_real("movement",	"KEY_RIGHT",	global.KEY_RIGHT);
	global.KEY_UP =		ini_read_real("movement",	"KEY_UP",		global.KEY_UP);
	global.KEY_DOWN =	ini_read_real("movement",	"KEY_DOWN",		global.KEY_DOWN);
	global.KEY_JUMP =	ini_read_real("movement",	"KEY_JUMP",		global.KEY_JUMP);
	global.KEY_ATTACK = ini_read_real("movement",	"KEY_ATTACK",	global.KEY_ATTACK);
	global.KEY_SPECIAL= ini_read_real("movement",	"KEY_SPECIAL",	global.KEY_SPECIAL);
	ini_close();
}
