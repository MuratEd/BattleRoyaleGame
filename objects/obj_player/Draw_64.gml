//Variables
var timer = 0;
with(obj_game) 
{
	timer = alarm_get(0);
}

//Drawing
drawHealth(health_point,health_max);
drawStamina(stamina,stamina_max,can_run);
drawEquipement(helmet_isEquiped,kevlar_isEquiped);

if(!show_map) {
	drawRanking();
	drawKills(player_kill);
	drawReductionTimer(timer);
}
else
{
	drawMap(x_map,y_map);
	drawStatsLeft(timer);
	drawStatsRight(x,y,player_kill);
}


if(blood_screen != 0)
{
	drawBloodVignetting(blood_screen);
}
if(barrier_screen != 0)
{
	drawBarrierVignetting(barrier_screen);
}

if(pause)
{
	drawPause();
}

if(obj_game.one_last)
{
	drawWinScreen(player_kill,rank_def);
}
if(is_dead)
{
	drawDeathScreen(player_kill,rank_def);
}




//Draw Inventory
draw_set_color(c_black);
draw_set_font(fnt_cocogoose12);
draw_set_halign(fa_right);
draw_set_valign(fa_center);
draw_text(window_get_width()-40,window_get_height()-20,string(obj_game.item_array[item_selected].item_name));
draw_text(window_get_width()-40,window_get_height()-50,string(ds_map_find_value(inventory_map,item_selected)));
draw_sprite(obj_game.item_array[item_selected].sprite_index,0,window_get_width()-80,window_get_height()-55);

draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_text(40,window_get_height()-20,string(obj_game.item_array[weapon_selected].weapon_name));
draw_sprite(obj_game.item_array[weapon_selected].sprite_index,0,80,window_get_height()-55);
