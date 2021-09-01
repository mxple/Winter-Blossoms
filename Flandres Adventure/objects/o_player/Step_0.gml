/// @description Player Movement

///initialize variables
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
jump = keyboard_check_pressed(ord("W"));
glide = keyboard_check(ord("W"));
crouch = keyboard_check(ord("S"));
sprint = keyboard_check(vk_shift);

var hmove = right - left;
if sprint {
	xspeed += hmove * 0.6;
	xspeed = clamp(xspeed, -runspd, runspd);	
} else {
	xspeed += hmove * 0.4;
	xspeed = clamp(xspeed, -walkspd, walkspd);	
}
if hmove = 0 {
	xspeed = lerp(xspeed, 0, 0.35);
}
 

///jumping and gliding
if !place_meeting(x, y + 1, collidable) {
	if (glide and !jump and yspeed > 0) {
		yspeed = 4; ///glide resistance
	} else {
		yspeed += gravity_;
	}
	if (doubleJump and jump) {
		yspeed = jumpSpeed + 1; ///double jump height
		doubleJump = false;
	}
} else if jump {
	yspeed = jumpSpeed;
	
}

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

