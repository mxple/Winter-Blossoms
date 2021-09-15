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
	if (glide and !jump and yspeed > 0) {
		yspeed = 3.5; ///glide resistance
	} else {
		yspeed += gravity_;
	}
	if (doubleJump and jump and charm_doublejump) {
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

