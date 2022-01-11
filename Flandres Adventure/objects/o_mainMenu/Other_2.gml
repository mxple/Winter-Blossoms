/// @description loading data
load_settings();
ini_open("settings.ini");
audio_master_gain(ini_read_real("settings","volume",1));
ini_close();
alarm[0] = 1;