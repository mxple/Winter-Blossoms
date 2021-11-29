/// @description draw onto screen
//align middle text right
draw_set_valign(fa_middle);
draw_set_halign(fa_right);
draw_set_font(menuFont);
var c = c_white;

var ds_grid = menu_pages[page], 
	ds_height = ds_grid_height(ds_grid),
	y_buffer = 32, //y buffer = distance between entries vertically
	x_buffer = 16, //x buffer is distance from midline
	start_y = (GUI_H/2)-(((ds_height-1)/2) * y_buffer), start_x = GUI_W/2,
	ltx = start_x - x_buffer, 
	lty;

//Draw elements on left
for(var yy = 0; yy<ds_height; yy++) {
	lty = start_y + (yy*y_buffer);
	c = c_white;
	
	if (yy == menu_option[page]) {
		c = c_aqua;
	}
	
	draw_text_color(ltx, lty, ds_grid[# 0 , yy],c,c,c,c,1);
}

//Draw dividing line
draw_line(start_x, start_y, start_x, lty);
