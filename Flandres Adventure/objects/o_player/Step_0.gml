/// @description Player Movement
//variables
facingRight = (hsp>0)
facingDown = (vsp>0)

if (hsp>0) dir = 1;
else if (hsp<0) dir = -1;

//hp stuff
if y > room_height health = 0;
health = clamp(health,0,5);
flash = approach(flash,0, 1);


switch (state)
{
	case PLAYERSTATE.IDLE: PlayerState_Idle(); break;
	case PLAYERSTATE.RUNNING: PlayerState_Running(); break;
	case PLAYERSTATE.JUMPING: PlayerState_Jumping(); break;
	case PLAYERSTATE.FALLING: PlayerState_Falling(); break;
	case PLAYERSTATE.SOFTLANDING: PlayerState_SoftLanding(); break;
	case PLAYERSTATE.HARDLANDING: PlayerState_HardLanding(); break;
	case PLAYERSTATE.DYING: PlayerState_Dying(); break;
	case PLAYERSTATE.ATTACK_ONE: PlayerState_Attack_One(); break;
	case PLAYERSTATE.ATTACK_TWO: PlayerState_Attack_Two(); break;
	case PLAYERSTATE.ATTACK_THREE: PlayerState_Attack_Three(); break;
	case PLAYERSTATE.LOCKED: break;
}
#region debug
//switch (state)
//{
//	case PLAYERSTATE.IDLE: show_debug_message("idle"); break;
//	case PLAYERSTATE.RUNNING: show_debug_message("running"); break;
//	case PLAYERSTATE.JUMPING: show_debug_message("jumping"); break;
//	case PLAYERSTATE.FALLING: show_debug_message("falling"); break;
//	case PLAYERSTATE.SOFTLANDING: show_debug_message("soft land"); break;
//	case PLAYERSTATE.HARDLANDING: show_debug_message("hard land"); break;
//	case PLAYERSTATE.DYING: break;
//	case PLAYERSTATE.ATTACK_ONE: show_debug_message("one"); break;
//	case PLAYERSTATE.ATTACK_TWO: show_debug_message("two");break;
//	case PLAYERSTATE.ATTACK_THREE: break;
//	case PLAYERSTATE.LOCKED: break;
//}
#endregion
