/// @description Insert description here
// You can write your code in this editor
if INPUT_ATTACK or INPUT_ENTER {
	file_delete("profile"+string(o_gameData.profile)+".json");
	game_restart();
}