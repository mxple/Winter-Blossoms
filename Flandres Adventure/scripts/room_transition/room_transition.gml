function room_transition(tRoom=Spawn, destinationX = 0, destinationY = 0, m=TRANSMODE.OUT){
    with (o_transition) {
        targetRoom = tRoom;
        self.destinationX = destinationX;
        self.destinationY = destinationY;
		mode = m; 
    }
}