timer = argument0;

draw_set_color(c_black);
draw_set_font(fnt_cocogoose20);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
if(!obj_game.process_resize)
{
	if(timer%3600/60<10)
	{
		draw_text(window_get_width()/2,40,string(floor(timer%216000/3600))+":0"+string(floor(timer%3600/60)));
	}
	else
	{
		draw_text(window_get_width()/2,40,string(floor(timer%216000/3600))+":"+string(floor(timer%3600/60)));
	}
}