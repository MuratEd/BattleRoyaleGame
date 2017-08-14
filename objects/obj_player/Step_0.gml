if(obj_game.pause) exit;

//Inputs
input_left = keyboard_check(ord("Q")) || gamepad_axis_value(0,gp_axislh)<0;
input_right = keyboard_check(ord("D")) || gamepad_axis_value(0,gp_axislh)>0;
input_up = keyboard_check(ord("Z")) || gamepad_axis_value(0,gp_axislv)<0;
input_down = keyboard_check(ord("S")) || gamepad_axis_value(0,gp_axislv)>0;
input_run = keyboard_check(vk_shift) || gamepad_button_check(0,gp_shoulderlb) || gamepad_button_check(0,gp_shoulderrb);
input_shot = gamepad_button_check(0,gp_shoulderl) || gamepad_button_check(0,gp_shoulderr);

//For smoother movement with gamepad
//https://docs.google.com/document/d/1lZmQleJxKYYW0evvt4t5k2_MgOFSSlhdPbmkVTa1SPU/edit?pageId=107174476290112596279

//Run
if(input_run && can_run)					//If player wants run and he can run
{	
	movesp = 7;								//Speed up
	stamina_regen = 0;						//Stamina cost
	stamina_cost = 4;
}
else if(!can_run)							//If player cant run
{
	movesp = 2;								//Speed decreased
	stamina_regen = 1;						//Stamina regeneration decreased
	stamina_cost = 0;
}
else										//If player dont run
{
	movesp = 4;								//Default speed
	stamina_regen = 2;						//Default stamina regeneration
	stamina_cost = 0;
}


//Calculing Stamina value
if(stamina<stamina_max && can_regen) stamina += stamina_regen;				//Regeneration of stamina
if(stamina>0) stamina -= stamina_cost							//Cost of stamina

if(stamina>stamina_max) stamina = stamina_max;
if(stamina<0) stamina = 0;

//Can run ?
if(stamina==0) can_run = 0;
if(!can_run && stamina>stamina_max*0.4) can_run = 1;


//Hit detection
	//Hitted in body ?
mask_index = spr_playerby;
if(place_meeting(x,y,obj_projectile) && !is_dead)
{
	var projectile_hit = instance_nearest(x,y,obj_projectile);
	health_point -= projectile_hit.dmg;
	instance_destroy(projectile_hit);
	blood_screen = 1;
}
	//Hitted in head ?
mask_index = spr_playerhs;
if(place_meeting(x,y,obj_projectile) && !is_dead)
{
	var projectile_hit = instance_nearest(x,y,obj_projectile);
	health_point -= projectile_hit.dmg*3;
	instance_destroy(projectile_hit);
	blood_screen = 1;
}
//Reset collision mask
mask_index = spr_player;

//Health
if(health_point<health_max && can_regen) health_point += floor(health_regen*(1+(stamina/stamina_max)*can_run));		//Regeneration of health
if(health_point>health_max) health_point = health_max;
if(health_point<0) health_point = 0;
//When no more HP
if(health_point==0 && !is_dead)
{
	is_dead = 1;
	obj_game.player_alive--;
}


//Death
if(is_dead)
{
	can_move = 0;
	can_regen = 0;
	health_point = 0;
	stamina = 0;
	can_run = 1;
}

//Crosshair
dir_cross = point_direction(0,0,gamepad_axis_value(0,gp_axisrh),gamepad_axis_value(0,gp_axisrv));
x_cross = x+pointer_radius*cos(degtorad(dir_cross));
y_cross = y-pointer_radius*sin(degtorad(dir_cross));


//Shoting
if(shot_cooldown != 0)
{
	shot_cooldown--;
}
if(input_shot && !shot_cooldown)
{
	audio_play_sound(snd_gunfire,0,0);
	new_projectile = instance_create_layer(x+60*cos(degtorad(dir_cross)),y-60*sin(degtorad(dir_cross)),"Projectiles",obj_projectile);
	new_projectile.shooter = self;
	new_projectile.spd = projectile_speed;
	new_projectile.dmg = projectile_damage;
	new_projectile.dir = point_direction(obj_player.x, obj_player.y, obj_player.x_cross, obj_player.y_cross);
	shot_cooldown = shot_cooldown_init;
}


//Movement
var hmove;
hmove = input_right - input_left;
hsp = hmove * movesp;

var vmove;
vmove = input_down - input_up;
vsp = vmove * movesp;

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