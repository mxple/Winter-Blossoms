/// @description Player Movement

///initialize variables
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
jump = keyboard_check_pressed(ord("W"));
glide = keyboard_check(ord("W"));
crouch = keyboard_check(ord("S"));
sprint = keyboard_check(vk_shift);

if sprint {
	if left {
		xspeed = -runspd;
	} else if right {
		xspeed = runspd;
	} else {
		xspeed = 0;
	}
} else {
	if left {
		xspeed = -walkspd;
	} else if right {
		xspeed = walkspd;
	} else {
		xspeed = 0;
	}
}

///jumping and gliding
if !place_meeting(x, y + 1, collidable) {
	if (glide and !jump and yspeed > 0) {
		yspeed += 0.3;
	} else {
		yspeed += gravity_;
	}
	if (doubleJump and jump) {
		yspeed = jumpSpeed + 3;
		doubleJump = false;
	}
} else if jump {
	yspeed = jumpSpeed;
	jumpcount++;
}

///collisions
if place_meeting(x + xspeed, y, collidable) {
	while !place_meeting(x + sign(xspeed), y, collidable) {
		x += sign(xspeed);
	}
	xspeed = 0;
}

x += xspeed;

if place_meeting(x, y + yspeed, collidable) {
	jumpcount = 0;
	yspeed = 0;
	doubleJump = true;
}

y += yspeed;

