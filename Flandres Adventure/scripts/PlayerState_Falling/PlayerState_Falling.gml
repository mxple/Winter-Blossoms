// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Falling(){
	sprite_index = s_playerFall;
	#region gravity, movement, collisions
	//horizontal movement
	hmove = INPUT_RIGHT-INPUT_LEFT;
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
	if facingDown 
	{
		vsp += grav-drag;
		drag = vsp/dragcoef;
	} 
	else 
	{
		vsp += grav;
	}
	if (INPUT_DOWN) drag/=2;

	//jumping
	if (INPUT_JUMP && jump) 
	{
		vsp+=jumpSpeed;
		jump = false;
	}
	if (vsp < 0) && (!keyboard_check(global.KEY_JUMP)) vsp = max(vsp,jumpSpeed/minJump);
	
	//collision handling
	var horizCollision = tileMeetingPrecise(x+hsp, y, "Collisions");
	var vertCollision = tileMeetingPrecise(x, y+vsp+1, "Collisions");

	//grace
	if vertCollision or tileMeetingPrecise(x,y+vsp+5, "Collisions") coyote = 6; 
	coyote--;
	if coyote > 0 jump = true; else jump = false;
	
	//moving but without decimal jitter yay
	hspRemaining += hsp;
	repeat(abs(hspRemaining)) {
		hspRemaining = approach(hspRemaining, 0, 1);
		var _xdir = sign(hsp);
		
		if (tileMeetingPrecise(x+_xdir, y, "Collisions"))
		{
			if (tileMeetingPrecise(x+_xdir, y-4, "Collisions")) {
				hsp = 0;
				hspRemaining = 0;
				break;
			} 	
			y-=1;
		}     
	  x += _xdir;
	}
	
	vspRemaining += vsp;
	var oldvsp = vsp;
	repeat(abs(vspRemaining)) {
		vspRemaining = approach(vspRemaining, 0, 1);
		var _ydir = sign(vsp);
		if (tileMeetingPrecise(x, y+_ydir, "Collisions"))
		{
			vsp = 0;
			vspRemaining = 0;
			break;
		}     
	  y += _ydir;
	}
	#endregion

	//state change
	if (health = 0)								state = PLAYERSTATE.DYING;
	else if (INPUT_ATTACK)						state = PLAYERSTATE.ATTACK_ONE;
	else if vsp=0 {
		if (oldvsp>6.98) {						
			state = PLAYERSTATE.HARDLANDING;
			screen_shake(8);
		}
		else if (oldvsp>4) {
			if oldvsp > 6.6 {
				screen_shake(1.5);
			}
			state = PLAYERSTATE.SOFTLANDING;
		}
		else									state = PLAYERSTATE.IDLE;
	}
}