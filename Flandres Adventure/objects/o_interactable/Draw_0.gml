/// @description glow effect
if place_meeting(x,y,o_player) {
	shader_set(shd_smoothOutline);
	var texture = sprite_get_texture(sprite_index, image_index);
	var pixelH = texture_get_texel_height(texture);
	var pixelW = texture_get_texel_width(texture);
	shader_set_uniform_f(shader_get_uniform(shd_smoothOutline, "texel"), pixelW, pixelH);
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, 0, image_blend, image_alpha);
	shader_reset();
}