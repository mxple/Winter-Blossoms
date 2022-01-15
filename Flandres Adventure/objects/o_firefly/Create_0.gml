/// @description Insert description here
turn_speed = 0;
timer = 0;
direction_target = 0;
direction = irandom(360);

size=random_range(0.02,0.15);


with(instance_create_depth(x,y,0,o_light)) {
	hue = choose($EA07FFAFF, $007FFFFF, $00FFFFFF);
	luminosity = 0.5;
	image_xscale=other.size;
	image_yscale=other.size;
	wobble=0.01;
	objFollowing = other;
}