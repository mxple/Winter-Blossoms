// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_HardLanding(){
	sprite_index = s_playerHardLand;
	vsp = 0;
	
	if image_index == 0.2 audio_play_sound(sfxStep1Loud,1,false);
	
	if (health = 0)	state = PLAYERSTATE.DYING;
	
	if(animation_end()) {
		state = PLAYERSTATE.IDLE;
	}
}