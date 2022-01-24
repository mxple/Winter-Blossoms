/// @description 
input += string_letters(keyboard_lastchar);
keyboard_lastchar = "";
if string_length(input) > 24 {
	input = string_delete(input, 24, 1);
}
alpha -= 0.01;
alpha = clamp(alpha,0,2);