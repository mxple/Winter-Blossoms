/// @description Selection 
input_down = keyboard_check_pressed(global.KEY_DOWN);
input_up = keyboard_check_pressed(global.KEY_UP);
var ds_grid = menu_pages[page],
	ds_height = ds_grid_height(ds_grid),
	optionChange = input_down - input_up;
	
if (optionChange != 0) {
	menu_option[page] += optionChange;
	if(menu_option[page] > ds_height-1) menu_option[page] = 0;
	if(menu_option[page] < 0) menu_option[page] = ds_height-1;
}

if(INPUT_ENTER || INPUT_ATTACK) {
	switch(ds_grid[# 1, menu_option[page]]) {
		case MENU_ELEMENT_TYPE.TRANS: page = ds_grid[# 2, menu_option[page]];
		optionChange = 0;
		break;
		case MENU_ELEMENT_TYPE.SLIDER:
		break;
	}
	audio_play_sound(sfxMenuClick, 1, false);
}