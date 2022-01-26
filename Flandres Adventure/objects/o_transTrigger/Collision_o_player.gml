/// @description Initiate room transition

o_player.fsm.change("paused");
room_transition(target,TRANSMODE.OUT,alterPosition, destinationX, destinationY);
   