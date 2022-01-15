/// @description draw HUD
//draw health, monies, energy
if drawHUD {
for (var i = 0; i < 5; i++) {
	if i<health draw_sprite(s_heart,0,i*+GUI_W/40+10,10);
	else draw_sprite(s_heartEmpty,0,i*+GUI_W/40+10,10);
}
}