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
camera_set_view_pos(VIEW, x-view_w_half, y-view_h_half);

//Parallax Background
//DO NOT TOUCH SKY LAYER IT IS PERFECT 
if (layer_exists(skyLayer)) 
{
	layer_x(skyLayer,x);
	layer_y(skyLayer,y-180);
}
//ok everything below is editable for depth and stuff
var _ypos = VIEW_Y/(room_height-VIEW_H);
var _camsize = VIEW_H;	
if (layer_exists(cloudsLayer)) 
{
	layer_x(cloudsLayer,x/2);
	layer_y(cloudsLayer,lerp(room_height*0.04,(room_height-_camsize),_ypos));
}
if (layer_exists(mountainsLayer)) 
{
	layer_x(mountainsLayer,x/2.8);
	layer_y(mountainsLayer,lerp(room_height*0.08,1*(room_height-_camsize),_ypos));
}
if (layer_exists(backTreesLayer))
{
	layer_x(backTreesLayer,x/4);
	layer_y(backTreesLayer,lerp(room_height*0.2,1*(room_height-_camsize),_ypos));
}
if (layer_exists(midTreesLayer)) 
{
	layer_x(midTreesLayer,x/6);
	layer_y(midTreesLayer,lerp(room_height*0.25,1*(room_height-_camsize),_ypos));
}
