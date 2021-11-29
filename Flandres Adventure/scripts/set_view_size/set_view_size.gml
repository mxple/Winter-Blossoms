// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_view_size(size){
	switch (size) {
		case ("640X360"):
			window_set_size(640,360);
		break;
		case ("1280x720"):
			window_set_size(1280,720);
		break;
		case ("1920x1080"):
			window_set_size(1920, 1080);
		break;
		case ("2560X1440"):
			window_set_size(2560, 1440);
		break;
	}
	show_debug_message("WORKING!");
}