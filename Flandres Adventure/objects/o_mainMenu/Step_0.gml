/// @description Selection 
input_down = keyboard_check_pressed(global.KEY_DOWN);
input_up = keyboard_check_pressed(global.KEY_UP);
input_left = keyboard_check_pressed(global.KEY_LEFT);
input_right = keyboard_check_pressed(global.KEY_RIGHT);

var ds_grid = menu_pages[page],
	ds_height = ds_grid_height(ds_grid),
	optionChange = input_down - input_up;

if (inputting) {
	switch(ds_grid[# 1, menu_option[page]]) {
		case MENU_ELEMENT_TYPE.SHIFT:
			var hinput = input_right-input_left;
			if !(hinput == 0){
				audio_play_sound(sfxMenuScroll,1,false);
				ds_grid[# 3, menu_option[page]] += hinput;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 3); //warning, 2 arbit num
			}
		break;
		case MENU_ELEMENT_TYPE.SLIDER:
			var hinput = INPUT_RIGHT-INPUT_LEFT;
			if !(hinput == 0){
				ds_grid[# 3, menu_option[page]] += hinput*0.01;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
			}
		break;
		case MENU_ELEMENT_TYPE.TOGGLE: 
			var hinput = input_right-input_left;
			if !(hinput == 0){
				audio_play_sound(sfxMenuScroll,1,false);
				ds_grid[# 3, menu_option[page]] += hinput;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
			}
		break;
		case MENU_ELEMENT_TYPE.INPUT:
			var lastKey = keyboard_lastkey;
			if !within(lastKey,invalidKeys) {
				ds_grid[# 3, menu_option[page]] = lastKey;
				variable_global_set(ds_grid[# 2, menu_option[page]], lastKey);
			}
			break;
		}					
			
} else {
	
	if (optionChange != 0) {
		audio_play_sound(sfxMenuScroll,1,false);
		menu_option[page] += optionChange;
		if(menu_option[page] > ds_height-1) menu_option[page] = 0;
		if(menu_option[page] < 0) menu_option[page] = ds_height-1;
	}
}

if(INPUT_ENTER || INPUT_ATTACK) {
	switch(ds_grid[# 1, menu_option[page]]) {
		case MENU_ELEMENT_TYPE.TRANS: page = ds_grid[# 2, menu_option[page]];
		optionChange = 0;
		break;
		case MENU_ELEMENT_TYPE.SCRIPT:
			script_execute( ds_grid[# 2, menu_option[page]]);
		break;
		case MENU_ELEMENT_TYPE.SHIFT:
			inputting = !inputting;
			if (inputting) script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);
		break;
		case MENU_ELEMENT_TYPE.SLIDER:
			inputting = !inputting;
			if (inputting) script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);
		break;
		case MENU_ELEMENT_TYPE.TOGGLE: 
			inputting = !inputting;
			if (inputting) script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);
		break;
		case MENU_ELEMENT_TYPE.INPUT:
			inputting = !inputting;
		break;
			
	}
	audio_play_sound(sfxMenuClick, 1, false);
}
