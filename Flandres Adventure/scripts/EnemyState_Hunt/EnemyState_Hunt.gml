// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_Hunt(){
	switch enemyType {
		case ("ghostWolf"): 
			sprite_index = s_ghostWolfHunt;
			
			#region gravity, collisions
			
			hsp = walkSpeed*sign(o_player.x-x);
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
			var tryJump = false;
			//moving but without decimal jitter yay
			hspRemaining += hsp; 
			repeat(abs(hspRemaining)) {
				hspRemaining = approach(hspRemaining, 0, 1);
				var _xdir = sign(hsp);
				if rotationBuffer <= 0 rotation = 0;
				rotationBuffer --;
				if (tileMeetingPrecise(x+_xdir, y, "Collisions"))
				{
					if (tileMeetingPrecise(x+_xdir, y-4, "Collisions")) {
						var tryJump = true;
						hsp = 0;
						hspRemaining = 0;
						break;
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
					vsp = 0;
					vspRemaining = 0;
					break;
				}     
			  y += _ydir;
			}
			while true {if (tileMeetingPrecise(x, y, "Collisions")) y-=1; break;}
			#endregion
			
			if hp <= 0 state = ENEMYSTATE.DEAD;
			else if abs(o_player.x-x) < 80 and distance_to_object(o_player)<120 state = ENEMYSTATE.ATTACK();
			else if abs(o_player.x-x) < 180 and (o_player.y-y) < 0 state = ENEMYSTATE.JUMP();
			else if tryJump state = ENEMYSTATE.JUMP();
			else if distance_to_object(o_player)>250 state = ENEMYSTATE.IDLE();
			
		break;
	}
}