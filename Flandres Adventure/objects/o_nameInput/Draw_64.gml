/// @description Insert description here
draw_set_halign(fa_middle);
draw_set_color(c_white);
draw_rectangle(1*GUI_W/5, 2*GUI_H/3-(fontSize), 4*GUI_W/5, GUI_H/2+(3*fontSize), true);

draw_set_font(font);
draw_text(GUI_W/2, GUI_H/4, "Enter your player name\nAlphabetic characters only\nHit enter to submit");
draw_text(GUI_W/2, 2*GUI_H/3-fontSize, input);

//error
var c = c_yellow;;
draw_text_color(GUI_W/2,4*GUI_H/5,"Everyone needs a name!",c,c,c,c,alpha);
