// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_data(){
	var data = array_create(0)

	with(o_gameData) {
		var temp = {
			profile : profile,
			time: time,
			
			name : pName,
			health : pHealth,
			room : pRoom,
			inventory : pInventory, 
			equipped : pEquipped,
			gold : pGold,
			tome : lTome,
			
			b1 : boss1
		};
	};
	array_push(data, temp);
	
	var json = json_stringify(data);
	save_string(json, "profile" + string(o_gameData.profile)+".json");
}