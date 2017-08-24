health_point = argument0;
health_max = argument1;

//Draw Health
	//Draw Indicator bar
draw_set_color(c_black);
draw_rectangle(395,window_get_height()-45,window_get_width()-395,window_get_height()-25,0);
draw_set_color(c_maroon);
draw_rectangle(400,window_get_height()-40,health_point*((window_get_width()-800)/health_max)+400,window_get_height()-30,0);
	//Draw Health value
draw_set_color(c_white);
draw_set_font(fnt_cocogoose12);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(window_get_width()/2,window_get_height()-33,string(health_point)+"/"+string(health_max));
