timer = argument0;

//Initialisation ----------------------------
draw_set_color(c_white);
draw_set_font(fnt_cocogoose20);
draw_set_valign(fa_center);




//Left alignement ---------------------------
draw_set_halign(fa_left);

draw_text(20,100,"Game time :");

if(!obj_game.process_resize)
{
	draw_text(20,140,"Next shrink :");
}

draw_text(20,220,"Player alive :");
draw_text(20,260,"Player at start :");




//Right alignement --------------------------
draw_set_halign(fa_right);

if(obj_game.game_time%3600/60<10)
{
	draw_text(420,100,string(floor(obj_game.game_time%216000/3600))+":0"+string(floor(obj_game.game_time%3600/60)));
}
else
{
	draw_text(420,100,string(floor(obj_game.game_time%216000/3600))+":"+string(floor(obj_game.game_time%3600/60)));
}

if(!obj_game.process_resize)
{
	if(timer%3600/60<10)
	{
		draw_text(420,140,string(floor(timer%216000/3600))+":0"+string(floor(timer%3600/60)));
	}
	else
	{
		draw_text(420,140,string(floor(timer%216000/3600))+":"+string(floor(timer%3600/60)));
	}
}

draw_text(420,220,string(obj_game.player_alive));
draw_text(420,260,string(obj_game.player_max));