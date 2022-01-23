/// @description textbox params
text = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.","Ut enim ad minim veniam, quis nostrudsl exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."]
spd = 0.5;
currIndex = 1;
currText = "";
page = 0;
name = o_gameData.pName;
portrait = noone;

//textbox size
x_padding = GUI_W/24;
y_padding = GUI_H/24;
x_start = x_padding;
y_start = 2*GUI_H/3;
width = GUI_W-2*x_padding;
height = GUI_H-y_start-y_padding;

//text formatting
font = dialogueBoxFont;
margin = 16;
line_sep = 1.4*font_get_size(font);
line_width = width - 2*margin;


