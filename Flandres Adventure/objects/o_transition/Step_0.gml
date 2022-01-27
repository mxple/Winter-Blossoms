/// @description Progress transition
if mode != TRANSMODE.OFF {
	if mode == TRANSMODE.IN {
		timer--;
		if (timer <= 14 and instance_exists(o_player)) o_player.fsm.change("idle");
		if (timer <= 0) mode = TRANSMODE.OFF;
	} else {
		timer ++;
		if (timer >= duration) {
			room_goto(targetRoom);
			alarm[0] = 1;
			mode = TRANSMODE.IN;
			save_data();
		}
	}	
	alpha = timer/duration;	
}
