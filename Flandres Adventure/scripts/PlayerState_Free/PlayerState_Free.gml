function PlayerState_Free() {
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
	if (vsp < 0) && (!keyboard_check(global.KEY_JUMP)) vsp = max(vsp,jumpSpeed/4);
	

	//grace
	if tileMeeting(x,y+vsp+1)||tileMeeting(x,y+vsp+5) coyote = 6; 
	coyote--;
	if coyote>0 jump = true; else jump = false;

	//collision handling
	//horizontal collision
	if (tileMeeting(x+hsp, y))
	{
		while (!tileMeeting(x+sign(hsp),y))
		{
			x += sign(hsp);
				wallJump = true;
		}
		hsp = 0;
		//WALLJUMPS WIP (needs to be able to take control away from player)
		/*if !(tileMeeting(x, y+vsp))&&!(tileMeeting(x, y+vsp+16)) {
			vsp*=fric;
			if jumping {
				hsp = jumpSpeed;
				vsp = jumpSpeed*0.8;
			}
		}*/
	}

	//vertical collision
	if (tileMeeting(x, y+vsp))
	{
		//if wasInAir audio_play_sound(sfxrun3,10,false);
		while (!tileMeeting(x,y+sign(vsp)))
		{
			y += sign(vsp);
		}
		wasInAir = false;
		vsp = 0;
	} else {
		wasInAir = true;
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

	//other movements (attacks, dashes, blocks)
	if (INPUT_ATTACK) state = PLAYERSTATE.ATTACK_ONE;
}