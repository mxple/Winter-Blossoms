// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_Dead(){
	audio_play_sound(sfxHowl,0,false);
	instance_destroy(id);
}