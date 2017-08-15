//Inputs
input_left = gamepad_axis_value(0,gp_axislh)<0 || keyboard_check(ord("Q"));
input_right = gamepad_axis_value(0,gp_axislh)>0 || keyboard_check(ord("D"));
input_up = gamepad_axis_value(0,gp_axislv)<0 || keyboard_check(ord("Z"));
input_down = gamepad_axis_value(0,gp_axislv)>0 || keyboard_check(ord("S"));
input_run = gamepad_button_check(0,gp_shoulderlb) || gamepad_button_check(0,gp_shoulderrb) || keyboard_check(vk_shift);
input_shot = gamepad_button_check(0,gp_shoulderl) || gamepad_button_check(0,gp_shoulderr) || mouse_check_button(mb_left);
input_pickup = gamepad_button_check_pressed(0,gp_face1) || keyboard_check(ord("F"));;
input_use = gamepad_button_check_pressed(0,gp_face2) || keyboard_check(ord("A"));
input_inv_left = gamepad_button_check_pressed(0,gp_padl) || keyboard_check_pressed(ord("C")); //Items
input_inv_right = gamepad_button_check_pressed(0,gp_padr) || keyboard_check_pressed(ord("E")); //Items
input_inv_up = gamepad_button_check_pressed(0,gp_padu) || mouse_wheel_up(); //Weapons
input_inv_down = gamepad_button_check_pressed(0,gp_padd) || mouse_wheel_down(); //Weapons


//For smoother movement with gamepad
//https://docs.google.com/document/d/1lZmQleJxKYYW0evvt4t5k2_MgOFSSlhdPbmkVTa1SPU/edit?pageId=107174476290112596279

//Game paused
if(obj_game.pause)
{
	input_left = 0;
	input_right = 0;
	input_up = 0;
	input_down = 0;
	input_run = 0;
	input_shot = 0;
	input_pickup = 0;
	input_use = 0;
	input_inv_left = 0;
	input_inv_right = 0;
	input_inv_up = 0;
	input_inv_down = 0;
}

//Hit detection
	//Hitted in body ?
mask_index = spr_playerby;
if(place_meeting(x,y,obj_projectile) && !is_dead)
{
	last_projectile_hit = instance_nearest(x,y,obj_projectile);
	health_point -= last_projectile_hit.dmg;
	blood_screen = 1
	instance_destroy(last_projectile_hit);
}
	//Hitted in head ?
mask_index = spr_playerhs;
if(place_meeting(x,y,obj_projectile) && !is_dead)
{
	last_projectile_hit = instance_nearest(x,y,obj_projectile);
	health_point -= last_projectile_hit.dmg*headshot_dmg;
	blood_screen = 1
	instance_destroy(last_projectile_hit);
}
	//Reset collision mask
mask_index = spr_player;


//Run
if(input_run && can_run)					//If player wants run and he can run
{	
	mvsp = runsp;								//Speed up
	stamina_regen = 0;							//Stamina cost
	stamina_cost = 4;
}
else if(!can_run)							//If player cant run
{
	mvsp = slowsp;								//Speed decreased
	stamina_regen = 1;							//Stamina regeneration decreased
	stamina_cost = 0;
}
else										//If player dont run
{
	mvsp = walksp;								//Default speed
	stamina_regen = 2;							//Default stamina regeneration
	stamina_cost = 0;
}



//Stamina
	//Regeneration and cost of stamina
if(stamina<stamina_max && can_regen) stamina += stamina_regen;
if(stamina>0) stamina -= stamina_cost;
	//Overflow management
if(stamina>stamina_max) stamina = stamina_max;
if(stamina<0) stamina = 0;



//Health
	//Regeneration
if(health_point<health_max && can_regen) health_point += floor(health_regen*(1+(stamina/stamina_max)*can_run));		//Regeneration of health
	//Overflow management
if(health_point>health_max) health_point = health_max;
if(health_point<0) health_point = 0;
	//0HP
if(health_point==0 && !is_dead)
{
	is_dead = 1;
	rank_def = obj_game.player_alive;
	obj_game.player_alive--;
}

//Inventory
if(input_inv_left && item_selected != obj_game.item_id_min)
{
	item_selected--;
}
if(input_inv_right && item_selected != obj_game.item_id_max)
{
	item_selected++;
}
if(input_inv_up && weapon_selected != obj_game.weapon_id_max)
{
	weapon_selected++;
}
if(input_inv_down && weapon_selected != obj_game.weapon_id_min)
{
	weapon_selected--;
}


//Item using
if(input_use && can_use_item && ds_map_find_value(inventory_map,item_selected) != 0)
{
	ds_map_replace(inventory_map,item_selected,ds_map_find_value(inventory_map,item_selected)-1);
	
	switch(item_selected)
	{
		case obj_game.BANDAGE:
			health_point += 2000;
			break;
		case obj_game.MEDIC_KIT:
			health_max += 2000;
			health_point += 6000;
			break;
		case obj_game.ENERGY_DRINK:
			stamina += 1000;
			break;
		case obj_game.ENERGY_SNACK:
			stamina_max += 1000;
			stamina += 600;
			break;
		case obj_game.SCOPE:
			if(scope!=3) scope += 0.5;
			if(pointer_radius<=1000) pointer_radius += 50;
			break;
		case obj_game.LASER:
			laser_radius = 1;
			if(pointer_radius<=1000) pointer_radius += 50;
			break;
	}
}


//Zoom
camera_set_view_size(view_camera[0],window_get_width()*scope,window_get_height()*scope);


//Weapon selection
projectile_damage = obj_game.weapon_array[weapon_selected].dmg;
shot_cooldown_init = obj_game.weapon_array[weapon_selected].cd;
projectile_speed = obj_game.weapon_array[weapon_selected].spd;
projectile_distance = obj_game.weapon_array[weapon_selected].dist;

//Crosshair
var gp_num = gamepad_get_device_count();
for (var i = 0; i < gp_num; i++)
{
	if (gamepad_is_connected(i))
	{
		dir_cross = point_direction(0,0,gamepad_axis_value(0,gp_axisrh),gamepad_axis_value(0,gp_axisrv));
		x_cross = x+pointer_radius*cos(degtorad(dir_cross));
		y_cross = y-pointer_radius*sin(degtorad(dir_cross));
	}
	else
	{
		dir_cross = point_direction(x,y,mouse_x,mouse_y);
		x_cross = mouse_x;
		y_cross = mouse_y;
	}
}

//Shoting
if(shot_cooldown != 0)
{
	shot_cooldown--;
}
if(input_shot && !shot_cooldown)
{
	audio_play_sound(snd_gunfire,0,0);
	new_projectile_fire = instance_create_layer(x+60*cos(degtorad(dir_cross)),y-60*sin(degtorad(dir_cross)),"Projectiles",obj_projectile);
	new_projectile_fire.shooter = self;
	new_projectile_fire.spd = projectile_speed;
	new_projectile_fire.dmg = projectile_damage;
	new_projectile_fire.dis = projectile_distance;
	new_projectile_fire.dir = point_direction(obj_player.x, obj_player.y, obj_player.x_cross, obj_player.y_cross);
	shot_cooldown = shot_cooldown_init;
}



//Player status
	//Can run ?
if(stamina==0) can_run = 0;
if(!can_run && stamina>stamina_max*0.4) can_run = 1;
	//Death
if(is_dead)
{
	can_move = 0;
	can_run = 0;
	can_regen = 0;
	can_use_item = 0;
	health_point = 0;
	stamina = 0;
}



//Movement
var hmove;
hmove = input_right - input_left;
hsp = hmove * mvsp;

var vmove;
vmove = input_down - input_up;
vsp = vmove * mvsp;

	//Collisions
if(place_meeting(x+hsp,y,par_collision))
{
	while(!place_meeting(x+sign(hsp),y,par_collision))
	{
		x = x + sign(hsp)
	}
	hsp = 0;
}

if(place_meeting(x,y+vsp,par_collision))
{
	while(!place_meeting(x,y+sign(vsp),par_collision))
	{
		y = y + sign(vsp)
	}
	vsp = 0;
}

	//No movement when dead
if(!can_move)
{
	hsp = 0;
	vsp = 0;
}

	//Movement definitive
x = x + hsp;
y = y + vsp;