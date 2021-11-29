/// @description Player Movement
//variables

facingRight = (hsp>0)
facingDown = (vsp>0)

switch (state)
{
	case PLAYERSTATE.FREE: PlayerState_Free(); break;
	case PLAYERSTATE.ATTACK_ONE: PlayerState_Attack_One(); break;
}