/// @description 
if !instance_exists(objFollowing) instance_destroy(id);
if objFollowing != noone {
	x += (objFollowing.x-x)/followDelay;
	y += (objFollowing.y-y)/followDelay;
}
