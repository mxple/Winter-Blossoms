/// @description 
if !instance_exists(objFollowing) instance_destroy();
if objFollowing != undefined {
	x += (objFollowing.x-x)/followDelay;
	y += (objFollowing.y-y)/followDelay;
}
