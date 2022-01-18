 /// @description Creating variables
 //physics constants
walkSpeed = 2.5;
grav = .7;
jumpSpeed = -12;
dragcoef = 10;
accel = 0.7;
deccel = 0.5;
fric = 0.95;
minJump = 6;

//variables
jump = false;
drag = 0;
hsp = 0;
vsp = 0;
hspRemaining=0;
vspRemaining=0;
image_speed = 0.12;
image_xscale=1.5;
image_yscale=1.5 ;

dir = 1;
rotation = 0;
rotationBuffer = 0;
knockback = false;

//enemy stats
damageTaken = 0;
hp = 10;
enemyType="ghostWolf";

enum ENEMYSTATE
{
	IDLE,
	HUNT,
	JUMP,
	ATTACK,
	HIT,
	SPECIAL,
	DEAD,
}
state = ENEMYSTATE.IDLE;
lastState = state;