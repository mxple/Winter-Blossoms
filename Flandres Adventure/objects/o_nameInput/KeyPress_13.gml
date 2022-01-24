/// @description
if string_length(input) {
	with instance_create_layer(0,0,"Instances_1",o_gameData) {
		profile = other.profile;
		pName = other.input;
		health = pHealth;
	}
	room_goto(Spawn);
	save_data();
	instance_create_layer(0,0,"Instances_1",o_pauseMenu);
	instance_destroy(self);
} else {
	alpha = 2;
}