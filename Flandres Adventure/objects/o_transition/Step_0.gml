/// @description Progress transition

if mode != TRANSMODE.OFF {
	if mode == TRANSMODE.IN {
		timer--;
		if (timer <= ceil(duration/3)) o_player.state = PLAYERSTATE.FREE;
		if (timer <= 0) mode = TRANSMODE.OFF;
	} else {
		timer ++;
		if (timer >= duration) {
			room_goto(targetRoom);
			mode = TRANSMODE.IN;
		}
	}
	alpha = timer/duration;	
}