/// @description Character facing and animation

if (xspeed>0) {
	dir = 1;
} else if (xspeed<0) {
	dir = -1;
}

draw_sprite_ext(s_player, 0, x, y, dir, 1, 0, image_blend, image_alpha);

draw_sprite_ext(s_bow, 0, x, y-3, dir, 1, 0, image_blend, image_alpha);