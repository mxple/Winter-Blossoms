/// @description Player Movement
//variables
left = keyboard_check(key_left);
right = keyboard_check(key_right);
up = keyboard_check(key_up);
jumping = keyboard_check_pressed(key_jump);
down = keyboard_check(key_down);
hold = keyboard_check(key_special);
if (hsp>0) facing = "right"; else facing = "left";
if (vsp>0) facing = "down"; else facing = "up";

//horizontal movement
hmove = right-left;
if hmove != 0 
{
	hsp += accel*hmove;
	hsp = clamp (hsp, -walkSpeed, walkSpeed);
}
else 
{
	hsp = lerp(hsp, 0, deccel);
}

//vertical movement
//gravity and terminal velocity and drag | terminal is grav * dragcoef
if vsp>0 
{
	vsp += grav-drag;
	drag = vsp/dragcoef;
} 
else 
{
	vsp += grav;
}
if (down) drag/=2;

//jumping
if (jumping && jump) 
{
	vsp+=jumpSpeed;
	jump = false;
}
if (vsp < 0) && (!up) vsp = max(vsp,jumpSpeed/4);

//walljumps 
/*if wallJumpGrace > 0 
{
	if jumping and stamina>0 and !(tileMeeting(x, y+8)) {
		stamina -= 20;
		hsp += 10;
}*/
//grace
if tileMeeting(x,y+vsp+1)||tileMeeting(x,y+vsp+5) {
	coyote = 5; 
	stamina = staminaMax;
}
coyote--;
if coyote>0 jump = true; else jump = false;

//collision handling
//horizontal collision and climbing
if (tileMeeting(x+hsp, y))
{
	while (!tileMeeting(x+sign(hsp),y))
	{
		x += sign(hsp);
			wallJump = true;
	}
	if (hsp>0) hsp = clamp(hsp, -infinity, 0); else hsp = clamp(hsp, 0, infinity);
	wallJumpGrace = 4;
	//wallclimb
	if !(tileMeeting(x, y+1)) and vsp>0 {
		vsp*=fric;
	}
	if hold and stamina>0{
		vsp = 0;
		stamina -= 1;
	}
	if up and stamina>0 and hold {
		vsp -= climbSpeed;
		stamina -= 3;
	}
}

//vertical collision
if (tileMeeting(x, y+vsp))
{
		while (!tileMeeting(x,y+sign(vsp)))
		{
			y += sign(vsp);
		}
	vsp = 0;
}
show_debug_message(stamina);
//moving but without decimal jitter yay
hspRemaining += hsp;
repeat(abs(hspRemaining)) {
	hspRemaining = approach(hspRemaining, 0, 1);
	var _xdir = sign(hsp);
	if (tileMeeting(x + _xdir, y))
	{
		hsp = 0;
		hspRemaining = 0;
		break;
	}     
  x += _xdir;
}
vspRemaining += vsp;
repeat(abs(vspRemaining)) {
	vspRemaining = approach(vspRemaining, 0, 1);
	var _ydir = sign(vsp);
	if (tileMeeting(x, y + _ydir))
	{
		vsp = 0;
		vspRemaining = 0;
		break;
	}     
  y += _ydir;
}