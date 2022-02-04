/// @description typewriter effect
input = keyboard_check_pressed(vk_space) or keyboard_check_pressed(global.KEY_ATTACK) or keyboard_check_pressed(global.KEY_ENTER); 

if string_copy(text[page],1,1) == "[" {
	var optionsEnd = string_pos("]", text[page])-2;
	var options = string_copy(text[page],2,optionsEnd);
	talker = string_copy(options,1,1);
	expression = string_copy(options,2,1);
	text[page] = string_delete(text[page],1,optionsEnd+2);
}

var name = noone;

//portrait and name
switch talker {
	case "p": 
		name = o_gameData.pName;
		switch expression {
			case "1": portrait = s_playerPortraitNeutral; break;
			case "2": portrait = s_playerPortraitTalking; break;
			case "3": portrait = s_playerPortraitSmug; break;
			case "4": portrait = s_playerPortraitBlush; break;
			default: portrait = s_playerPortraitTalking; break;
		}
	break;
	case "n":
		name = noone;
		portrait = noone;
	break;
	case "o": 
		name = "???";
		portrait = noone;//
	break;
}


if name != noone {
	currText = name + "\n";
} else {
	currText = "";
}

//beeping sfx
if currIndex < string_length(text[page]) and alpha >= 1 {
	drawArrow = false;
	if currIndex%1 == 0 {
		audio_stop_sound(sfxBeep);
		audio_play_sound(sfxBeep,1,false);
	}
} else {
	audio_stop_sound(sfxBeep);
	if alpha >= 1 drawArrow = true;
}


if pauseDuration <= 0 pauseDuration = 10;
if string_copy(text[page],currIndex+1,1) == "#" or pauseDuration != 10 {
	if pauseDuration == 10 {
		text[page] = string_delete(text[page], currIndex+1, 1); //gets rid of #
	}
	currText += string_copy(text[page],1, currIndex);
	audio_stop_sound(sfxBeep);
	pauseDuration--;
} else if alpha>=1{
	currIndex += spd;
	currText += string_copy(text[page],1, currIndex);
}

//page flipping
if input and acceptingInput {
	if currIndex < string_length(text[page]) {
		text[page] = string_replace_all(text[page],"#","");
		currIndex = string_length(text[page]);
	} else {
		page += 1;
		currIndex = 0;
	}
	if page >= array_length_1d(text) {
		o_player.acceptingInput = true;
		instance_destroy(id);
	}	
}
