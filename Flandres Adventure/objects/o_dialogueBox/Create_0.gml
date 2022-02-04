/// @description textbox params
text = [
	"[n]",
	"[p1] ##...",
	"[p] Where am I?",
	"[p] Ack,# my head hurts!",
	"[p] I remember...# Oh no! I was on my way to buy medicine at the port!# The elders are counting on me!",
	"[p] But...# where even am I?",
	"[p] I was trekking my way through the forest just a moment ago...",
	"[p] And my bag is gone!# I can't enter the Kingdom without documentation..."	
];
spd = 0.5;
currIndex = 1;
currText = "";
page = 0;
pauseDuration = 10;
acceptingInput = false;
drawArrow = false;
//delay
alpha = 0;
alarm[0] = 30;

thingTalking = o_enemy; //obj that creates the textbox
portrait = noone;
talker = noone;
expression = noone;

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

