// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_data(profile){
	switch profile {
		case("PROFILE 1"):
			var p = 1;
			break;
		case("PROFILE 2"):
			var p = 2;
			break;
		case("PROFILE 3"):
			var p =3;
			break;
		default:
		return "";
	}
		

	var filename = "profile"+string(p)+".json";
	if (!file_exists(filename)) {
		return( "Empty" );
	}
	//Load JSON
	var json = load_string(filename);
	var data = json_parse(json);
	data = data[0];
	
	return( data.name+"\n"+room_get_name(data.room)+"\n"+string(data.time)+" minutes" );
}