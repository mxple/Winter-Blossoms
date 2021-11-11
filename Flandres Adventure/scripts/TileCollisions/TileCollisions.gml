function tileMeeting(xpos, ypos, layer_="Collisions"){
	    tilemap = layer_tilemap_get_id(layer_);

	var _x1 = tilemap_get_cell_x_at_pixel(tilemap, bbox_left + (xpos - x), y),
	    _y1 = tilemap_get_cell_y_at_pixel(tilemap, x, bbox_top + (ypos - y)),
	    _x2 = tilemap_get_cell_x_at_pixel(tilemap, bbox_right + (xpos - x), y),
	    _y2 = tilemap_get_cell_y_at_pixel(tilemap, x, bbox_bottom + (ypos- y));

	for(var _x = _x1; _x <= _x2; _x++){
	 for(var _y = _y1; _y <= _y2; _y++){
	    if(tile_get_index(tilemap_get(tilemap, _x, _y))){
	    return true;
	    }
	 }
	}
	return false;
}