/// @description Init scripts

init_sprites = function() {
	for (var i=0; i<argument_count; i+=2) {
		sprites[$ argument[i]] = argument[i+1];
	}
};
