/// @description Update Camera
// You can write your code in this editor

//Update destination
if (instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
}

//Update camera position
x += (xTo - x) / 16;
y += (yTo - y) / 16;

x = clamp(x,view_w_half+shakeBuffer,room_width-view_w_half-shakeBuffer);
y = clamp(y,view_h_half+shakeBuffer,room_height-view_h_half-shakeBuffer);


//Parallax Background
//DO NOT TOUCH SKY LAYER IT IS PERFECT 
if (layer_exists(bglayer1))			
{
	layer_x(bglayer1,x);
	layer_y(bglayer1,y-180);
}
//ok everything below is editable for depth and stuff
var _ypos = VIEW_Y/(room_height-VIEW_H);	
if (layer_exists(bglayer2)) 
{
	layer_x(bglayer2,x/2);
	layer_y(bglayer2,lerp(room_height*0.04,(room_height-VIEW_H),_ypos));
}
if (layer_exists(bglayer3)) 
{
	layer_x(bglayer3,x/2.8);
	layer_y(bglayer3,lerp(room_height*0.06,1*(room_height-VIEW_H),_ypos));
}
if (layer_exists(bglayer4))
{
	layer_x(bglayer4,x/3.4);
	layer_y(bglayer4,lerp(room_height*0.12,1*(room_height-VIEW_H),_ypos));
}
if (layer_exists(bglayer5)) 
{
	layer_x(bglayer5,x/6);
	layer_y(bglayer5,lerp(room_height*0.3,1*(room_height-VIEW_H),_ypos));
}

//shakes
x += random_range(-shakeRemain, shakeRemain);
y += random_range(-shakeRemain, shakeRemain);
shakeRemain = max(0, shakeRemain - ((1/shakeLength)*shakeStrength));

//Update camera view
camera_set_view_pos(VIEW, x-view_w_half, y-view_h_half);