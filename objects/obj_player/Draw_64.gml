#region Variables
var timer = 0;
with(obj_game) 
{
	timer = alarm_get(0);
}

#endregion

#region Drawing
drawHealth(healthPoint,healthMax);
drawStamina(staminaPoint,staminaMax,canRun);
drawEquipement(helmetEquiped,kevlarEquiped);

if(!showMap) {
	drawRanking();
	drawKills(kill);
	drawReductionTimer(timer);
}
else
{
	drawMap(mapX,mapY);
	drawStatsLeft(timer);
	drawStatsRight(x,y,kill);
}


if(bloodScreen != 0)
{
	drawBloodVignetting(bloodScreen);
}
if(barrierScreen != 0)
{
	drawBarrierVignetting(barrierScreen);
}

if(showPause)
{
	drawPause();
}

if(obj_game.one_last)
{
	drawWinScreen(kill,rankDef);
}
if(isDead)
{
	drawDeathScreen(kill,rankDef);
}

#endregion

//Draw Inventory
draw_set_color(c_black);
draw_set_font(fnt_cocogoose12);
draw_set_halign(fa_right);
draw_set_valign(fa_center);
draw_text(window_get_width()-40,window_get_height()-20,string(obj_game.item_array[itemSelected].item_name));
draw_text(window_get_width()-40,window_get_height()-50,string(ds_map_find_value(inventoryMap,itemSelected)));
draw_sprite(obj_game.item_array[itemSelected].sprite_index,0,window_get_width()-80,window_get_height()-55);

draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_text(40,window_get_height()-20,string(obj_game.item_array[weaponSelected].weapon_name));
draw_sprite(obj_game.item_array[weaponSelected].sprite_index,0,80,window_get_height()-55);
