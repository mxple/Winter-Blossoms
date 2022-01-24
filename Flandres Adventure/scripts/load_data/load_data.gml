// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_data(profile){
	profile += 1;
	var filename = "profile"+string(profile)+".json";
	if (!file_exists(filename)) {
		instance_create_depth(0,0,0,o_nameInput);
		o_nameInput.profile = profile;	
		instance_deactivate_object(o_mainMenu);
		return;
	}
	//Load JSON
	var json = load_string(filename);
	var data = json_parse(json);
	data = data[0];
	//set game data
	with(instance_create_layer(0,0,"Instances_1",o_gameData)) {
		self.profile = data.profile;
		time = data.time;
		pName = data.name;
		pHealth = data.health;
		pRoom = data.room;
		pInventory = data.inventory;
		pEquipped = data.equipped;
		pGold = data.gold;
		lKnife = data.knife;
		lWaki = data.waki;
		lKatana = data.katana;
		bYeti = data.yeti;
	}
	room_goto(o_gameData.pRoom);
	health = o_gameData.pHealth;
	global.gold = o_gameData.pGold;
	instance_create_layer(0,0,"Instances_1",o_pauseMenu);
}
