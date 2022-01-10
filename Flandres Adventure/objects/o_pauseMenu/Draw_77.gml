/// @description Drawing background 
if (pause) {
	if !(surface_exists(pause_surf)) {
		pause_surf = surface_create(w,h);
		buffer_set_surface(surf_buffer, pause_surf, 0);
	}
	
	var surf_aspect = w/h;
	var win_aspect = WIN_W/WIN_H;
	
	var scale;
	if (surf_aspect > win_aspect) {
		scale = WIN_W/w;
	} else {
		scale = WIN_H/h;
	}

	draw_surface_ext(pause_surf, (WIN_W- w * scale)/2, (WIN_H - h * scale)/2, scale, scale, 0, gray, 1);
}