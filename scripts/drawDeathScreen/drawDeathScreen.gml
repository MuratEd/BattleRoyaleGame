//Draw Death Screen
kill = argument0;
rank = argument1;

draw_set_color(c_black);
draw_set_alpha(0.85);
draw_rectangle(0,0,window_get_width(),window_get_height(),0);

draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(fnt_cocogoose70);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(window_get_width()/2,window_get_height()/2,"Dead...");
	
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(fnt_cocogoose35);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(window_get_width()/2,window_get_height()*(3/4),string(kill)+" kills             "+"Rank "+string(rank));