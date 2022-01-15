 /// @description Character facing and animation
if state != lastState {
	image_index = 0;
	lastState = state;
}

//image_index += 0.25;

draw_sprite_ext(sprite_index, image_index, x, y, dir, 1, 0, image_blend, image_alpha);

//draw_sprite(s_temp,0,x,y);
