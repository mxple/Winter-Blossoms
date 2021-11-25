
function room_transition(m, tRoom=Spawn, alterPosition = false, destinationX = 0, destinationY = 0){
    with (o_transition)
    {
        mode = m;
        targetRoom = tRoom;
        self.alterPostition = alterPosition;
        self.destinationX = destinationX;
        self.destinationY = destinationY;
    }
}