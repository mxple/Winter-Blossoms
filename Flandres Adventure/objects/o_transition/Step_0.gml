/// @description Progress transition
if mode != TRANSMODE.OFF {
	if mode == TRANSMODE.IN {
		timer--;
		if (timer <= 14 and instance_exists(o_player)) o_player.state = PLAYERSTATE.FREE;
		if (timer <= 0) mode = TRANSMODE.OFF;
	} else {
		timer ++;
		if (timer >= duration) {
			room_goto(targetRoom);
			mode = TRANSMODE.IN;
			save_data();
		}
	}
	alpha = timer/duration;	
}
