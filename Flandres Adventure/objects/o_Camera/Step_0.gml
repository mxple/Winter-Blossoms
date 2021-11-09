/// @description Update Camera
// You can write your code in this editor

//Update destination
if (instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
}

//Update camera position
x += (xTo - x) / 10;
y += (yTo - y) / 10;

x = clamp(x,view_w_half,room_width-view_w_half);
y = clamp(y,view_h_half,room_height-view_h_half);

//Update camera view
camera_set_view_pos(cam, x-view_w_half, y-view_h_half);
	
	
	