 /// @description Creating variables
 //physics constants
walkSpeed = 5;
grav = .7;
jumpSpeed = -13;
dragcoef = 10;
accel = 0.7;
deccel = 0.5;
fric = 0.95;
coyote=15;
minJump=6;

//variables
jump = false;
drag = 0;
hsp = 0;
vsp = 0;
hspRemaining=0;
vspRemaining=0;
combo = false;
drawHUD = true;
flash = 0;


//Drawing
sprite_index = s_playerIdle;
image_index = 0;
image_speed = 0.12;
dir = 1;

//State machine
state = PLAYERSTATE.LOCKED;
lastState = PLAYERSTATE.LOCKED;

enum PLAYERSTATE
{
	IDLE,
	RUNNING,
	JUMPING,
	FALLING,
	SOFTLANDING,
	HARDLANDING,
	DYING,
	ATTACK_ONE,
	ATTACK_TWO,
	ATTACK_THREE,
	LOCKED
}

//Other
hitByAttack = ds_list_create();