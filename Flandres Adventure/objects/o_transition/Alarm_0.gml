/// @description 
if instance_exists(o_player) {
	o_player.x = destinationX;
	o_player.y = destinationY;
	if instance_exists(o_camera) {
		o_camera.x = o_player.x;
		o_camera.y = o_player.y;
	}
}