/// @description Insert description here
// You can write your code in this editor
o_gameData.lTome = true;

with instance_create_layer(0,0,"overlays",o_popup) {
	upperText = "Aquired!\nAncient Tome";
	bottomText = "A dusty book with an illegible runic title and faded letters. It looks important though.";
	sprite_index = s_tome;
	spriteSize = 4;
	destroyInteractable = other.id;
}
