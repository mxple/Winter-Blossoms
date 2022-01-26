// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function move_x() {
hspRemaining += hsp;
	repeat(abs(hspRemaining)) {
		hspRemaining = approach(hspRemaining, 0, 1);
		var _xdir = sign(hsp);
		
		if (tileMeetingPrecise(x+_xdir, y))
		{
			if (tileMeetingPrecise(x+_xdir, y-4)) { //sloped collisions
				hsp = 0;
				hspRemaining = 0;
				break;
			} 	
			y-=1;			
		}     
	  x += _xdir;
	}
}

function move_y() {
	vspRemaining += vsp;
	repeat(abs(vspRemaining)) {
		vspRemaining = approach(vspRemaining, 0, 1);
		var _ydir = sign(vsp);
		if (tileMeetingPrecise(x, y+_ydir))
		{
			vsp = 0;
			vspRemaining = 0;
			break;
		}     
	  y += _ydir;
	}
	while true {if (tileMeetingPrecise(x, y)) y-=1; break;} //prevents gettings stuck in the ground
}

function apply_gravity() {
	if vsp > 0 {
		vsp += grav-drag;
		drag = vsp/dragcoef;
	} else {
		vsp += grav;
	}
}