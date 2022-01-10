// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_view_size(size){
	switch (size) {
		case (0):
			window_set_size(640,360);
		break;
		case (1):
			window_set_size(1280,720);
		break;
		case (2):
			window_set_size(1920, 1080);
		break;
		case (3):
			window_set_size(2560, 1440);
		break;
	}
}