/// @description 
if !audio_is_playing(next_song) {
	audio_play_sound(next_song,1000,loop);
	
	audio_sound_gain(next_song,0,0);
	audio_sound_gain(next_song,1,1500);
	
	audio_sound_gain(current_song,0,1000);
} 
if audio_sound_get_gain(current_song) == 0 {
	audio_stop_sound(current_song);
	current_song = next_song;
}
