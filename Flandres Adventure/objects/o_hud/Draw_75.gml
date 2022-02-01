if drawHUD {
	draw_sprite(s_HUD,0,7,8);
	for (var i = 0; i < 5; i++) {
		if i<health draw_sprite(s_hitPoint,0,i*28+70,15);
		else draw_sprite(s_hitPointEmpty,0,i*28+70,15);
	}
}