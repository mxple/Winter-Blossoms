/// @description 
switch (room) {
	case (Menu):	next_song = sfxMusic_MenuLoop;		break;
	case (Spawn):	next_song = sfxMusic_Theme1;		break;
	case (Credits):	next_song = sfxMusic_CreditsLoop;	break;
	default:		next_song = sfxNone;
}