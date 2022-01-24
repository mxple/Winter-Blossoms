/// @description checking for interact
if (INPUT_SPECIAL) and !instance_exists(o_dialogueBox) and global.activeInteractable==id{
	event_user(0);
}