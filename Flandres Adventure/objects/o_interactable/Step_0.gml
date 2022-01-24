/// @description Insert description here
// You can write your code in this editor
if place_meeting(x,y,o_player) and !global.touchingInteractable{
	global.activeInteractable = id;
	global.touchingInteractable = true;
}

if global.activeInteractable==id and !place_meeting(x,y,o_player) {
	global.activeInteractable = noone;
	global.touchingInteractable = false;
}
