/// @description Insert description here
// You can write your code in this editor
o_gameData.lTome = true;

with instance_create_layer(0,0,"overlays",o_popup) {
	upperText = "Acquired!\nAncient Tome";
	bottomText = "A dusty book...the title is in runes? It's illegible, but I'll keep it just in case.";
	sprite_index = s_tome;
	spriteSize = 4;
	destroyInteractable = other.id;
}
