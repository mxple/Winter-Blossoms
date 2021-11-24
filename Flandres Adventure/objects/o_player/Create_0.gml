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

//controls
key_left = (vk_left);
key_right = (vk_right);
key_down = (vk_down);
key_up = ord("C");
key_jump = ord("C");
key_special = ord("X");
key_attack = ord("Z");


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