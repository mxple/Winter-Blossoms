/// @description 
if instance_exists(objFollowing) {
	x += (objFollowing.x-x)/followDelay;
	y += (objFollowing.y-y)/followDelay;
} else {
	instance_destroy(id);
}