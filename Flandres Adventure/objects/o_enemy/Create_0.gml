 /// @description Creating variables
 //physics constants
walkSpeed = 5.4;
grav = 1;
jumpSpeed = -15;
dragcoef = 10;
accel = 0.6;
deccel = 0.3;
fric = 0.95;

//variables
jump = false;
drag = 0;
hsp = 0;
vsp = 0;
hspRemaining=0;
vspRemaining=0;

//enemy stats
flash = 4;

hp = 4;

enum ENEMYSTATE
{
	FREE,
	ATTACK,
	HIT,
	DEAD,

}