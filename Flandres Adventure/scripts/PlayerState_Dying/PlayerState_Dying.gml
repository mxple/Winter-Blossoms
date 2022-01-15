// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Dying() {
	instance_destroy(o_pauseMenu);
	sprite_index = s_playerDeath;
	hsp = approach(hsp, 0, .1);
	audio_master_gain((8-image_index)/10); 
	#region gravity, collisions

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
	if animation_end() {
		image_speed=0;	
		room_transition(rGameOver,TRANSMODE.OUT);
	}
}