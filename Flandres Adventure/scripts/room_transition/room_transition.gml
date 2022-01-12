
function  (tRoom=Spawn, m=TRANSMODE.OUT, alterPosition = false, destinationX = 0, destinationY= 0){
    with (o_transition)
    {
        mode = m; 
        targetRoom = tRoom;
        self.alterPosition = alterPosition;
        self.destinationX = destinationX;
        self.destinationY = destinationY;
    }
}