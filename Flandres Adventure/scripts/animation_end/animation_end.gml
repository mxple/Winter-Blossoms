//returns true if the animation will loop this step.
function animation_end(_sprite = sprite_index, _image = image_index) 
{
	var _type=sprite_get_speed_type(sprite_index);
	var _spd=sprite_get_speed(sprite_index)*image_speed;
	if(_type == spritespeed_framespersecond)
		_spd = _spd/room_speed;
	if(argument_count > 2) _spd=argument[2];
	return _image+_spd >= sprite_get_number(_sprite);
}