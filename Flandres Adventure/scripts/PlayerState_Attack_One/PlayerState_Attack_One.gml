function PlayerState_Attack_One(){
	#region gravity, movement, collisions
	//horizontal movement
	hmove = INPUT_RIGHT-INPUT_LEFT;
	if image_index < 1 {
		hsp = 7*dir;
		vsp = 0
		screen_shake(1);
	}
	else hsp = 0;
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
				if image_index==4 screen_shake(3,20);
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
	while true {if (tileMeetingPrecise(x, y, "Collisions")) y-=1; break;}
	#endregion
	
	//start attack animation
	if (sprite_index != s_playerAttackOne)
	{
		sprite_index = s_playerAttackOne;
		image_index = 0;
		ds_list_clear(hitByAttack);
	}

	//check for hits
	mask_index = s_playerAttackOneHB;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x,y,o_enemy,hitByAttackNow,false);
	if (hits > 0)
	{
		vsp=0;
		for (var i = 0; i < hits; i++)
		{
			//if not yet hit by slash
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hitByAttack, hitID) == -1)
			{
				ds_list_add(hitByAttack, hitID);
				with (hitID)
				{
					hit(2);
				}			
			}
		}
	}
	ds_list_destroy(hitByAttackNow);
	mask_index = s_playerIdle;
	
	if(image_index == 0) audio_play_sound(choose(sfxWeaponSwoosh1,sfxWeaponSwoosh2),1,false);
	
	if INPUT_ATTACK combo = true;
	if (animation_end() and combo)
	{
		state = PLAYERSTATE.ATTACK_TWO;
	}	
	else if animation_end() {
		state = PLAYERSTATE.IDLE;
	}
}