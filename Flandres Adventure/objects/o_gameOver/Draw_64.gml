/// @description
draw_set_valign(fa_top);
draw_set_halign(fa_middle);
draw_set_font(menuFont);
alpha+=0.01;
draw_text_transformed_color(GUI_W/2, GUI_H/2 - 48, "GAME OVER",2,2,0,c,c,c,c,alpha);
draw_text_transformed_color(GUI_W/2, GUI_H/2 + 48, ">> Back to Menu <<",0.8,0.8,0,$ba8f4f,$ba8f4f,$ba8f4f,$ba8f4f,alpha-0.5);