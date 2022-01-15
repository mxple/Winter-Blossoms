// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Running(){
	sprite_index = s_playerRun;
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
			if (tileMeetingPrecise(x+_xdir, y-5, "Collisions")) {
				hsp = 0;
				hspRemaining = 0;
				break;
			} 	
			y-=1;
		}     
	  x += _xdir;
	}
	if jump and vsp >= 0 && tileMeetingPrecise(x,y+8,"Collisions")
{while(!tileMeetingPrecise(x,y+1,"Collisions")) {y += 1;}}

	vspRemaining += vsp;
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
	
	while true {if (tileMeetingPrecise(x, y, "Collisions")) y-=1; break;}
	#endregion
	
	//sfx
	if (image_index == 2 or image_index == 6) audio_play_sound(choose(sfxStep1,sfxStep2,sfxStep3),1,false);
	//state change
	if (health = 0)								state = PLAYERSTATE.DYING;
	else if (INPUT_ATTACK)						state = PLAYERSTATE.ATTACK_ONE;
	else if (vertCollision and hmove==0)		state = PLAYERSTATE.IDLE;
	else if (!jump and (vsp < 0)) {
		 audio_play_sound(sfxJump,0,false);
		 state = PLAYERSTATE.JUMPING;
	}
	else if (vsp > 4 and !vertCollision)		state = PLAYERSTATE.FALLING;

}