// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_move_x() {
	if hmove != 0 {
		hsp += accel*hmove;
		hsp = clamp (hsp, -walkSpeed, walkSpeed);
	} else {
		hsp = lerp(hsp, 0, deccel);
	}
}

function player_move_y() {
	//jumping
	if (INPUT_JUMP && jump) {
		vsp+=jumpSpeed;
		jump = false;
	}
	if (vsp < 0) && (!keyboard_check(global.KEY_JUMP)) vsp = max(vsp,jumpSpeed/minJump);
}

function collide_x() {
hspRemaining += hsp;
	repeat(abs(hspRemaining)) {
		hspRemaining = approach(hspRemaining, 0, 1);
		var _xdir = sign(hsp);
		
		if (tileMeetingPrecise(x+_xdir, y)) {
			if (tileMeetingPrecise(x+_xdir, y-5)) { //sloped collisions
				hsp = 0;
				hspRemaining = 0;
				break;
			} 	
			y-=1;			
		}     
	  x += _xdir;
	}
	//going down slopes
	if jump and vsp >= 0 and tileMeetingPrecise(x,y+8,"Collisions")
{while(!tileMeetingPrecise(x,y+1,"Collisions")) {y += 1;}}
}

function collide_y() {
	vspRemaining += vsp;
	repeat(abs(vspRemaining)) {
		vspRemaining = approach(vspRemaining, 0, 1);
		var _ydir = sign(vsp);
		if (tileMeetingPrecise(x, y+_ydir))	{
			vsp = 0;
			vspRemaining = 0;
			break;
		}     
	  y += _ydir;
	}
	while true {if (tileMeetingPrecise(x, y)) y-=1; break;} //prevents getting stuck in the ground
}

function apply_gravity() {
	if vsp > 0 {
		vsp += grav-drag;
		drag = vsp/dragcoef;
	} else {
		vsp += grav;
	}
}

function attack(maskHB, damage) {
	var temp = mask_index;
	mask_index = maskHB;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x,y,o_enemy,hitByAttackNow,false);
	if (hits > 0) {
		vsp=0;
		for (var i = 0; i < hits; i++) {
			//if not yet hit by slash
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hitByAttack, hitID) == -1) {
				ds_list_add(hitByAttack, hitID);
				with (hitID) {
					hit(damage);
				}			
			}
		}
	}
	ds_list_destroy(hitByAttackNow);
	mask_index = temp;
}