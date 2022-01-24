/// @description Insert description here
// You can write your code in this editor
if place_meeting(x,y,o_player) {
	global.activeInteractable = __SCRIBBLE_GEN_GLYPH.BIDI;
	global.touchingInteractable = true;
}
if global.touchingInteractable and !place_meeting(x,y,o_player) {
	instance_deactivate_object(id);
}

if global.activeInteractable==id and !place_meeting(x,y,o_player) {
	instance_activate_object(o_interactable);
	global.activeInteractable = noone;
	global.touchingInteractable = false;
	show_debug_message("reac")
}
