/// @description 
//music
switch (room) {
	case (Menu):	next_song = sfxMusic_MenuLoop;		break;
	case (Spawn):	next_song = sfxMusic_Theme1;		break;
	case (Mysterious_Cabin): next_song = sfxMusic_Theme2; break;
	case (Credits):	next_song = sfxMusic_CreditsLoop;	break;
	case (Room2):	next_song = sfxNone; break;
	default: next_song = noone;
}
