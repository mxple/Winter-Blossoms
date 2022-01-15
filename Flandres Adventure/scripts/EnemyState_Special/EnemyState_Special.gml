// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_Special(){
	switch enemyType {
		case ("ghostWolf"):
			sprite_index = s_ghostWolfSpecial;
			if image_index == 2 audio_play_sound(sfxHowl,0,false);
			if hp <= 0 state = ENEMYSTATE.DEAD;
			else if animation_end() {
				if distance_to_object(o_player) < 250 state = ENEMYSTATE.HUNT;
				else state = ENEMYSTATE.IDLE;
			}
	}
}