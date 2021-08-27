/// @description Player Movement
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));
jump = keyboard_check(ord("W"));
crouch = keyboard_check(ord("S"));
sprint = keyboard_check(vk_shift);

var move = right - left;

if sprint {
	xspeed = move * runspd;
} else {
	xspeed = move * walkspd;
}

if place_meeting(x + xspeed, y, collidable) {
	while !place_meeting(x + sign(xspeed), y, collidable) {
		x += sign(xspeed);
	}
	xspeed = 0;
}

x += xspeed;
