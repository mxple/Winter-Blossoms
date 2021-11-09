/// @description Player Movement

///initialize variables
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
	/*while !place_meeting(x + sign(xspeed), y, collidable) {
		x += sign(xspeed);
	} */
	xspeed = 0;
}

x += xspeed;

if place_meeting(x, y + yspeed, collidable) {
	yspeed = 0;
	doubleJump = true;
}
if place_meeting(x, y + yspeed, ceiling) {
	yspeed = 0;
}


y += yspeed;

