 /// @description Character facing and animation

if (hsp>0) {
	dir = 1;
} else if (hsp<0) {
	dir = -1;
}

draw_sprite_ext(s_playerIdle, 0, x, y+1, dir, 1, 0, image_blend, image_alpha);

//draw_sprite_ext(s_bow, 0, x, y-3, dir, 1, 0, image_blend, image_alpha);