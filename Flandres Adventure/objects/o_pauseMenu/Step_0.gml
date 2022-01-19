/// @description pausing
if (keyboard_check_pressed(vk_escape)) {
	global.pause = !global.pause;
	if global.pause {
		application_surface_draw_enable(false);
	
		w = surface_get_width(application_surface);
		h = surface_get_height(application_surface);
	
		//take surface screenshot
		if !surface_exists(pause_surf) pause_surf = surface_create(w, h);
		surface_copy(pause_surf, 0, 0, application_surface);
	
		surf_buffer = buffer_create(w * h * 4, buffer_fixed, 1);
		buffer_get_surface(surf_buffer, pause_surf, 0);
	
		instance_deactivate_all(true);
		instance_activate_object(o_gameData);
		instance_activate_object(o_snowParticles);
		audio_pause_all();
		part_system_automatic_update(global.particles_main_system,false);
		if variable_global_exists("particles_snow_system") part_system_automatic_update(global.particles_snow_system,false);
	} else {
		part_system_automatic_update(global.particles_main_system,true);
		if variable_global_exists("particles_snow_system") part_system_automatic_update(global.particles_snow_system,true);
	}
}
if global.pause {
	#region MENU
		
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
					ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, array_length(ds_grid[# 4, menu_option[page]])-1);
				}
			break;
			case MENU_ELEMENT_TYPE.SLIDER:
				var hinput = INPUT_RIGHT-INPUT_LEFT;
				if !(hinput == 0){
					ds_grid[# 3, menu_option[page]] += hinput*0.01;
					ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]], 0, 1);
				}
				ini_open("settings.ini");
				ini_write_real("settings", "volume", ds_grid[# 3, menu_option[page]]);	
				ini_close();
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
					ini_open("settings.ini");
					ini_write_real("movement", ds_grid[# 2, menu_option[page]], lastKey);	
					ini_close();
					inputting = !inputting;
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
				script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);
			break;
			case MENU_ELEMENT_TYPE.SHIFT:
				inputting = !inputting;
				//if !(inputting) script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 4, menu_option[page]]);

				if !(inputting) script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);

			break;
			case MENU_ELEMENT_TYPE.SLIDER:
				inputting = !inputting;
				if !(inputting) script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);
			break;
			case MENU_ELEMENT_TYPE.TOGGLE: 
				inputting = !inputting;
				if !(inputting) script_execute(ds_grid[# 2, menu_option[page]], ds_grid[# 3, menu_option[page]]);
			break;
			case MENU_ELEMENT_TYPE.INPUT:
				inputting = !inputting;
			break;
			
		}
		audio_play_sound(sfxMenuClick, 1, false);
	}

	if(INPUT_BACK) and (page != MENU_ITEMS.MAIN) {
		inputting = false;
		page = ds_grid[# 2, ds_height-1];
	}
	#endregion		
} else {
	application_surface_draw_enable(true);
	surface_free(pause_surf);
	buffer_delete(surf_buffer);
	
	instance_activate_all();
	audio_resume_all();
} 