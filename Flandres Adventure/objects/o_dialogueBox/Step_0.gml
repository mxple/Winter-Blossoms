/// @description typewriter effect
if name != noone {
	currText = name + "\n";
} else {
	currText = "";
}
currIndex += spd;
currText += string_copy(text[page],1, currIndex);
if keyboard_check_pressed(vk_space) or keyboard_check_pressed(global.KEY_ATTACK) or keyboard_check_pressed(global.KEY_RIGHT) {
	if currIndex < string_length(text[page]) {
		currIndex = string_length(text[page])
	} else {
		page += 1;
		currIndex = 0;
	}
	if page >= array_length_1d(text) {
		instance_destroy(self);
	}
	
}