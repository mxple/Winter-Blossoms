// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_data(profile){
	profile += 1;
	var filename = "profile"+string(profile)+".json";
	if (!file_exists(filename)) {
		instance_create_layer(0,0,"Instances_1",o_gameData);
		o_gameData.profile = profile;
		room_goto(Spawn);
		save_data();
		return;
	}
	//Load JSON
	var json = load_string(filename);
	var data = json_parse(json);
	data = data[0];
	show_debug_message(data)
	//set game data
	with(instance_create_layer(0,0,"Instances_1",o_gameData)) {
		self.profile = data.profile;
		time = data.time;
		self.pName = data.name;
		self.pHealth = data.health;
		self.pRoom = data.room;
		self.pInventory = data.inventory;
		self.pEquipped = data.equipped;
		self.pGold = data.gold;
		self.lKnife = data.knife;
		self.lWaki = data.waki;
		self.lKatana = data.katana;
		self.bYeti = data.yeti;
	}
	room_goto(o_gameData.pRoom);
	instance_create_layer(0,0,"Instances_1",o_pauseMenu);
}
