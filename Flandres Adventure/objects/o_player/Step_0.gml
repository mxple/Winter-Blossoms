/// @description Player Movement
//variables
left = keyboard_check(key_left);
right = keyboard_check(key_right);
up = keyboard_check(key_up);
jumping = keyboard_check_pressed(key_jump);
down = keyboard_check(key_down);
attack = keyboard_check_pressed(key_attack);

facingRight = (hsp>0)
facingDown = (vsp>0)

switch (state)
{
	case PLAYERSTATE.FREE: PlayerState_Free(); break;
	case PLAYERSTATE.ATTACK_ONE: PlayerState_Attack_One(); break;
}