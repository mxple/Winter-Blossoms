/// @description
draw_set_valign(fa_top);
draw_set_halign(fa_middle);
draw_set_font(menuFontSmall);
yb = 28;
alpha+=0.01;
draw_text_transformed_color(GUI_W/2, yb, "CREATOR",2,2,0,c,c,c,c,alpha);
draw_text_transformed_color(GUI_W/2, yb, "\nEric Li",1.7,1.7,0,c,c,c,c,alpha-0.1);
yb += 80;
draw_text_transformed_color(2*GUI_W/7, yb, "Textures",1.8,1.8,0,c,c,c,c,alpha-0.2);
yb+=5;
draw_text_transformed_color(2*GUI_W/7, yb, "\nEric Li",1.5,1.5,0,c,c,c,c,alpha-0.3);
draw_text_transformed_color(2*GUI_W/7, yb, "\n\nOnline assets",1.5,1.5,0,c,c,c,c,alpha-0.4);
draw_text_transformed_color(5*GUI_W/7, yb, "Music",1.8,1.8,0,c,c,c,c,alpha-0.2);
yb+=5;
draw_text_transformed_color(5*GUI_W/7, yb, "\nEric Li",1.5,1.5,0,c,c,c,c,alpha-0.3);
draw_text_transformed_color(5*GUI_W/7, yb, "\n\nRichard Yu",1.5,1.5,0,c,c,c,c,alpha-0.4);
yb += 110;
draw_text_transformed_color(2*GUI_W/7, yb, "Sound Design",1.8,1.8,0,c,c,c,c,alpha-0.5);
yb+=5;
draw_text_transformed_color(2*GUI_W/7, yb, "\nOnline assets",1.5,1.5,0,c,c,c,c,alpha-0.6);

draw_text_transformed_color(5*GUI_W/7, yb, "Coded in",1.8,1.8,0,c,c,c,c,alpha-0.5);
yb+=5;
draw_text_transformed_color(5*GUI_W/7, yb, "\nGMS2",1.5,1.5,0,c,c,c,c,alpha-0.6);

yb+= 90;
draw_text_transformed_color(GUI_W/2, yb, "GaSTC Digital Game Design Submission 2021",1,1,0,c,c,c,c,alpha-0.7);