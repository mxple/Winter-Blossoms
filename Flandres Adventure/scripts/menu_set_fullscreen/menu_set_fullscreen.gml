// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function menu_set_fullscreen(full){
	if full=="WINDOWED" {
		window_set_fullscreen(false);
	}
	if full=="FULLSCREEN" {
		window_set_fullscreen(true);
	}
}