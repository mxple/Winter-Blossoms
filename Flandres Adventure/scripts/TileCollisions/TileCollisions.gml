function tileMeeting(xpos, ypos, layer_="Collisions"){
	var tilemap = layer_tilemap_get_id(layer_);

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

function tileMeetingPrecise(xpos, ypos, layer_="Collisions"){
	var tilemap = layer_tilemap_get_id(layer_),
		checker = o_preciseTileChecker;
	
	if !instance_exists(checker) instance_create_depth(0,0,0,checker);
	
	var _x1 = tilemap_get_cell_x_at_pixel(tilemap, bbox_left + (xpos - x), y),
	    _y1 = tilemap_get_cell_y_at_pixel(tilemap, x, bbox_top + (ypos - y)),
	    _x2 = tilemap_get_cell_x_at_pixel(tilemap, bbox_right + (xpos - x), y),
	    _y2 = tilemap_get_cell_y_at_pixel(tilemap, x, bbox_bottom + (ypos- y));

	 for(var _x = _x1; _x <= _x2; _x++){
		 for(var _y = _y1; _y <= _y2; _y++){
			 var tile = tile_get_index(tilemap_get(tilemap, _x, _y));
			 if tile {
				if tile == 1 return true;
				checker.x = _x * tilemap_get_tile_width(tilemap);
				checker.y = _y * tilemap_get_tile_height(tilemap);
				checker.image_index = tile;
				if(place_meeting(xpos, ypos, checker)) return true;
			 }
			 
		    // if(tile_get_index(tilemap_get(tilemap, _x, _y))){
			//	return true;
		     //}
		 }
	}
	return false;
}