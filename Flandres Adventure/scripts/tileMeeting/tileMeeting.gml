// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function tileMeeting(xpos, ypos, layer_){
	var layer_id = layer_get_id(layer_);
	var tilemask = layer_tilemap_get_id(layer_id);

	var _x1 = tilemap_get_cell_x_at_pixel(tilemask, bbox_left + (xpos - x), y),
		_y1 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_top + (ypos - y)),
		_x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right + (xpos - x), y),
		_y2 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_bottom + (ypos - y));
	
}