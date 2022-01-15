// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_Hit(){
	switch enemyType {
		case "ghostWolf":
			#region gravity, collisions
			hsp = clamp(walkSpeed*damageTaken,0,16)*sign(x-o_player.x);
			if sprite_index != s_ghostWolfHit {
				vsp = clamp(-6*damageTaken,-15,0);
				audio_play_sound(sfxHowl,0,false);
			}
			sprite_index = s_ghostWolfHit;
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
			var endHit = false;
			hspRemaining += hsp; 
			repeat(abs(hspRemaining)) {
				hspRemaining = approach(hspRemaining, 0, 1);
				var _xdir = sign(hsp);
				if rotationBuffer <= 0 rotation = 0;
				rotationBuffer --;
				if (tileMeetingPrecise(x+_xdir, y, "Collisions"))
				{
					if (tileMeetingPrecise(x+_xdir, y-4, "Collisions")) {
						hsp = 0;
						hspRemaining = 0;
						break;
						endHit = true;
					} 
					rotation = 45;
					rotationBuffer = 4;
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
					endHit = true;
					vsp = 0;
					vspRemaining = 0;
					break;
				}     
			  y += _ydir;
			}
			while true {if (tileMeetingPrecise(x, y, "Collisions")) y-=1; break;}
			#endregion
			
			if hp <= 0 state = ENEMYSTATE.DEAD;
			else if endHit {
				damageTaken = 0;
				knockback=false;
				if distance_to_object(o_player)>250 state = ENEMYSTATE.IDLE;
				else state = ENEMYSTATE.HUNT;
			}
		break;
	}
}