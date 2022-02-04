/// @description textbox params
text = [
	"[n]",
	"[p] ##...",
	"[p] Where am I?",
	"[p] Ack,# my head hurts!",
	"[p] I remember...# oh no! My mission!",
	"[p] I have to buy medicine at the port!## The chieftan is counting on me!",
	"[p] But...# where even am I?",
	"[p] I was trekking my way through the forest just a moment ago...",
	"[p] Oh right!## There was a yeti in the way...",
	"[p] Looking back, it was cocky of me to try to take on a yeti...",
	"[p] Even though I'm the strongest swordsman in my village, I'm still only human.## Monsters are simply much too powrful...",
	"[p] It's depressing that even a small yeti can easily overpower me...# but what humans lack in strength, we have intellect and numbers!...",
	"[p] Or at least that's what master keeps telling me.# No one else in that little village can hope to offer any value on the battle field pfft.",
	"[p] Though...# I guess it's my rogue-like nature that ended me up here..."
	
];
spd = 0.5;
currIndex = 1;
currText = "";
page = 0;
pauseDuration = 10;
acceptingInput = false;
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

