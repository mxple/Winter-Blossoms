/// @description 
if !surface_exists(light) light = surface_create(GUI_W,GUI_H);

surface_set_target(light);

draw_clear_alpha(c_black,darkness);

with (o_light) {
	var wobblex = image_xscale + random_range(-wobble, wobble);
	var wobbley = image_yscale + random_range(-wobble, wobble);
	
	gpu_set_blendmode(bm_subtract);
	draw_sprite_ext(sprite_index, image_index, x-VIEW_X, y-VIEW_Y, wobblex, wobbley, 0, c_white, 1);
	gpu_set_blendmode(bm_add);
	draw_sprite_ext(sprite_index, image_index, x-VIEW_X, y-VIEW_Y, wobblex, wobbley, 0, hue, luminosity);
	gpu_set_blendmode(bm_normal);

}

surface_reset_target();
draw_surface(light,0,0);