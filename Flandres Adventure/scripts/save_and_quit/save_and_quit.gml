// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_and_quit(){
	save_data();
	instance_destroy(o_gameData);
	room_goto(Menu);
}