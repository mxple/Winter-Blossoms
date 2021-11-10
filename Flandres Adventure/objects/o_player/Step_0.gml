/// @description Player Movement

///initialize variables
var bbox_side;
left = keyboard_check(key_left);
right = keyboard_check(key_right);
jump = keyboard_check_pressed(key_jump);
glide = keyboard_check(key_jump);
crouch = keyboard_check(key_down);

var hmove = right - left;

xspeed += hmove * 0.8;
xspeed = clamp(xspeed, -walkspd, walkspd);	

if hmove = 0 {
	xspeed = lerp(xspeed, 0, 0.35);
}
yspeed= -1*gravity_;
//Tile Collisions
posx = xspeed>0;
if (posx) bbox_side = bbox_right; else bbox_side = bbox_left;
if (tilemap_get_at_pixel(t_collidable,bbox_side+xspeed,bbox_top) != 0) || (tilemap_get_at_pixel(t_collidable,bbox_side+xspeed, bbox_bottom) != 0)
{
	if (posx) x = x - (x % 16) + 15 - (bbox_right - x);
	else x = x - (x % 16) -(bbox_left - x);
	xspeed = 0;
}
posy = yspeed>0;
if (posy) bbox_side = bbox_bottom; else bbox_side = bbox_top;
if((tilemap_get_at_pixel(t_collidable, bbox_left,bbox_side+ceil(yspeed)) != 0) || (tilemap_get_at_pixel(t_collidable, bbox_right, bbox_side+ceil(y_speed)) != 0 ))
{
	if (posy) y = y - (y % 16) + 15 - (bbox_bottom - y);
	else y = y - (y % 16) -(bbox_top - y);
	yspeed = 0;
}

///jumping and gliding
if !place_meeting(x, y + 1, collidable) {
	/*if (doubleJump and jump and charm_doublejump) {
		yspeed = jumpSpeed; ///double jump height
		doubleJump = false;
	}*/ 
	if !glide and yspeed < 0 {
		gravity_ *=1.7;
	} else {
		gravity_ = 0.6;
	}
	
} else if jump {
	yspeed += jumpSpeed;
}

///gravity
if glide and yspeed > 2.5 {
	yspeed = 2.5; ///glide resistance
}
yspeed += gravity_;

///collisions
if place_meeting(x + xspeed, y, collidable) {

	xspeed = 0;
}


if place_meeting(x, y + yspeed, collidable) {
	yspeed = 0;
	doubleJump = true;
}
if place_meeting(x, y + yspeed, ceiling) {
	yspeed = 0;
}
*/

x += xspeed;
y += yspeed;

