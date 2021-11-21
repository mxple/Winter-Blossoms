/// @description Player Movement
//variables

if (hsp>0) facing = "right"; else facing = "left";
if (vsp>0) facing = "down"; else facing = "up";

//gravity
if vsp>0 
{
	vsp += grav-drag;
	drag = vsp/dragcoef;
} 
else 
{
	vsp += grav;
}


//horizontal collision
if (tileMeeting(x+hsp, y))
{
	while (!tileMeeting(x+sign(hsp),y))
	{
		x += sign(hsp);
			wallJump = true;
	}
	hsp = 0;
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