 /// @description Creating variables
 //physics constants
walkSpeed = 4;
grav = 1;
jumpSpeed = -15;
dragcoef = 10;
accel = 0.6;
deccel = 0.3;
fric = 0.95;
coyote=15;
//variables
dir = 1;
wallJump = false;
jump = false;
drag = 0;
hsp = 0;
vsp = 0;
hspRemaining=0;
vspRemaining=0;
state = PLAYERSTATE.LOCKED;



//other
hitByAttack = ds_list_create();
enum PLAYERSTATE
{
	FREE,
	ATTACK_ONE,
	ATTACK_TWO,
	ATTACK_THREE,
	LOCKED
}