/// @description Init scripts

init_sprites = function() {
	for (var i=0; i<argument_count; i+=2) {
		sprites[$ argument[i]] = argument[i+1];
	}
};

check_inputs = function() {
	with input {
		hmove = (keyboard_check(global.KEY_RIGHT) - keyboard_check(global.KEY_LEFT))*other.acceptingInput;
		jump = keyboard_check_pressed(global.KEY_JUMP)*other.acceptingInput;
		atk = keyboard_check_pressed(global.KEY_ATTACK)*other.acceptingInput;
		special = keyboard_check_pressed(global.KEY_SPECIAL)*other.acceptingInput;
	}
}
