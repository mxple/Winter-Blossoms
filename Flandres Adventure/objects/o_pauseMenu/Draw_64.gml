/// @description Draw the menu
if global.pause {
	draw_set_valign(fa_top);
	draw_set_halign(fa_middle);
	draw_set_font(menuFont);
	var c = c_white;
	var y_buffer = 64, //y buffer = distance between entries vertically
		x_buffer = 16; //x buffer is distance from midline

	var ds_grid = menu_pages[page], ds_height = ds_grid_height(ds_grid);
	var lty;

	//MAIN draw
	var start_y = GUI_H/5, start_x = GUI_W/2,
	ltx = start_x + x_buffer; 
	var xoffset = 0;

	//ELSE draw
	if (page != 0 and page != 1) {
		y_buffer = 32;
		draw_set_font(menuFontSmall);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_right);
		var start_y = (GUI_H/2)-(((ds_height-1)/2) * y_buffer), start_x = GUI_W/2,
		ltx = start_x - x_buffer; 
	}
	//Draw elements on left
	for(var yy = 0; yy<ds_height; yy++) {
		lty = start_y + (yy*y_buffer);
		c = c_white;
		xoffset = 0;
		if (page == 0 or page == 1) {
			if (yy == menu_option[page]) {
				c = $ba8f4f;
				draw_text_color(start_x, lty,">>  "+ds_grid[# 0 , yy]+"  <<",c,c,c,c,1);
			}
			draw_text_color(start_x, lty,ds_grid[# 0 , yy],c,c,c,c,1);
		} else {
			if (yy == menu_option[page]) {
				c = $ba8f4f;
			}
			draw_text_color(ltx-xoffset, lty, ds_grid[# 0 , yy],c,c,c,c,1);
			//Draw dividing line
			draw_line_color(start_x, start_y, start_x, lty, $ba8f4f, c_white);
		}
	}

	//Draw Elements on right
	draw_set_halign(fa_left);

	//rtx: X start pos
	//rty: Y start pos
	var rtx = start_x + x_buffer, rty;

	//looping through ds_grid
	for(var yy = 0; yy<ds_height; yy++) 
	{
		rty = start_y + (yy*y_buffer); //sets rty based on element number
	
		//current_val : initalized as default
		//current_array : possible values
		switch(ds_grid[#1,yy])
		{	
			case MENU_ELEMENT_TYPE.SHIFT:
				var current_val = ds_grid[# 3, yy];
				var current_array = ds_grid[# 4, yy];
				var left_shift = "<< ";
				var right_shift = " >>";
				c = c_white;
			
				//removal of << >>
				if(current_val == 0) left_shift = "";
				if(current_val == array_length_1d(ds_grid[#4, yy])-1) right_shift="";
			
				//drawing aqua color
				if(inputting and yy == menu_option[page]) c = $bed373;
				draw_text_color(rtx, rty, left_shift+current_array[current_val]+right_shift, c,c,c,c, 1);
			
				//PROFILES
				draw_set_font(menuFontSaves);
				draw_text_color(rtx+12, rty+48, get_data(current_array[current_val]), c,c,c,c, 1);
				draw_set_font(menuFontSmall);
			
			break;
			
			case MENU_ELEMENT_TYPE.SLIDER:
				var len = GUI_W/4; //slider length
				var current_val = ds_grid[# 3, yy]; 
				var current_array = ds_grid[# 4, yy];
				//circle_pos 
				var circle_pos = ((current_val - current_array[0]) / (current_array[1] - current_array[0]));
				c = c_white;
			
				draw_line_width_color(rtx, rty, rtx +len, rty, 2,c,c);
			
				if(inputting and yy == menu_option[page]) c = $bed373;
				draw_circle_color(rtx + (circle_pos*len), rty, 4, c,c, false);
				draw_text_color(rtx + (len * 1.2), rty, string(floor(circle_pos*100))+"%",c,c,c,c,1);
			break;
		
			case MENU_ELEMENT_TYPE.TOGGLE:
				var current_val = ds_grid[# 3, yy];
				var c1, c2;
				c = c_white;
			
				if(inputting and yy == menu_option[page]) c = $bed373;
				if(current_val == 0) { c1 = c; c2 = c_dkgrey; }
				else				 { c1 = c_dkgrey; c2 = c; }
			
				draw_text_color(rtx, rty, "OFF", c1,c1,c1,c1,1);
				draw_text_color(rtx+32, rty, "ON", c2,c2,c2,c2,1);
			break;
		
			case MENU_ELEMENT_TYPE.INPUT:
				var current_val = ds_grid[# 3, yy];
				var string_val;
				switch(current_val) {
					case vk_up:		string_val = "UP arrow"; break;
					case vk_down:		string_val = "DOWN arrow"; break;
					case vk_left:		string_val = "LEFT arrow"; break;
					case vk_right:		string_val = "RIGHT arrow"; break;
					default:			string_val = chr(current_val); break;
				}
				c = c_white;
				if(inputting and yy == menu_option[page]) c = $bed373;
				draw_text_color(rtx, rty, string_val, c,c,c,c, 1);
			break;
		}
	}
	draw_set_valign(fa_top);
}