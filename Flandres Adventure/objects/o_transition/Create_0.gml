/// @description Size variables and mode setup
duration = 40
targetRoom = room;
color = c_black;

timer = 40;
alpha = 1;


enum TRANSMODE
{
	OFF,
	OUT,
	IN
}

mode = TRANSMODE.IN;
alterPosition = false;
desinationX = 0;
destinationY = 0;