
function approach(a, b, amount) {
    return (a + clamp(b - a, -amount, amount));
}

function wave(from, to, duration, offset) {
	var a4 = (to-from)/2;
	return from + a4 + sin((((current_time * 0.001) + duration + offset) / duration) * (pi*2)) * a4;
}

function animation_end(_sprite = sprite_index, _image = image_index, _rate){
  var _type = sprite_get_speed_type(_sprite);
  var _spd = sprite_get_speed(_sprite)*image_speed;
  if(_type == spritespeed_framespersecond)
      _spd = _spd / room_speed;
  
  if(_rate != undefined)
    _spd = _rate;
  return _image+_spd >= sprite_get_number(_sprite);
}

function sprite_is_on_frame(_frame) {
    return    image_index >= _frame &&
            image_index - image_speed * sprite_get_speed(sprite_index) / (sprite_get_speed_type(sprite_index) == spritespeed_framespergameframe? 1 : game_get_speed(gamespeed_fps)) < _frame;
}

function within(myVar, searchList) {
	for (var i = 0; i<array_length_1d(searchList); i++) {
		if myVar == searchList[i] return true;
	}
	return false;
}

function save_string(_string, filename) {
	var buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	buffer_write(buffer, buffer_string, _string);
	buffer_save(buffer, filename);
	buffer_delete(buffer);
}

function load_string(filename) {
	var buffer = buffer_load(filename);
	var _string = buffer_read(buffer, buffer_string);
	buffer_delete(buffer);
	return _string;
}
