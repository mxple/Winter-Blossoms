// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function reset_default(){
	file_delete("settings.ini");
	load_settings();
	ini_open("settings.ini");
	audio_master_gain(ini_read_real("settings","volume",1));
	instance_destroy(o_mainMenu);
	with (instance_create_layer(0,0,"Instances_1",o_mainMenu)) {
		page = MENU_ITEMS.SETTINGS;
	}
	ini_close();
}