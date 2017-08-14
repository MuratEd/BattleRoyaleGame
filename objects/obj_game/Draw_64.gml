if(pause)
{
	draw_set_color(c_black);
	draw_set_alpha(0.5);
	draw_rectangle(0,0,room_width,room_height,0);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_font(fnt_cocogoose70);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(window_get_width()/2,window_get_height()/2,"Pause");
}

/*
if(last_player)
{
	draw_set_color(c_black);
	draw_set_alpha(0.2);
	draw_rectangle(0,0,room_width,room_height,0);
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_font(fnt_cocogoose70);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_text(window_get_width()/2,window_get_height()/2,"You are the last !");
}
*/