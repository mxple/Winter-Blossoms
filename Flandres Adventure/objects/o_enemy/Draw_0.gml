 /// @description Character facing and animation
if state != lastState {
	image_index = 0;
	lastState = state;
}
show_debug_message(sprite_index);
draw_sprite_ext(sprite_index, image_index, x, y, dir*image_xscale, image_yscale, rotation*dir, image_blend, image_alpha);
