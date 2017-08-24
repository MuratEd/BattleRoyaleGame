name = "Player";

//Movement
hsp = 0;
vsp = 0;
mvpsp = 0;
walksp = 4;
runsp = 7;
slowsp = 2;

//Player status
can_move = 1;
can_run = 1;
can_regen = 1;
can_use_item = 1;
is_dead = 0;

//GUI status
pause = 0;
show_map = 0;

//Stamina
stamina = 1000;
stamina_max = 1000;
stamina_regen = 0;
stamina_cost = 0;

//Health
health_point = 10000;
health_max = 10000;
health_regen = 0;
headshot_dmg = 3;
blood_screen = 0;
barrier_screen = 0;

//Statistics
player_kill = 0;
rank_def = 1;

//Projectiles
new_projectile_fire = -1;	//Newest projectile that player has fired
last_projectile_hit = -1;	//Lastest projectile that player has hit
shot_cooldown = 0;
projectile_damage = 0;
shot_cooldown_init = 0;
projectile_speed = 0;
projectile_distance = 0;

//Weapon equipement
pointer_radius = 100;
laser_radius = 0;
scope = 1;

//Crosshair
dir_cross = 0;
x_cross = x + 100;
y_cross = y;

//Inventory
item_selected = obj_game.item_id_min;
weapon_selected = obj_game.weapon_id_min;

inventory_map = ds_map_create();
for(var item_id = obj_game.item_id_min ; item_id<=obj_game.item_id_max ; item_id++)
{
	ds_map_add(inventory_map,item_id,0);
}
ds_map_replace(inventory_map,obj_game.BANDAGE,5);
ds_map_replace(inventory_map,obj_game.ENERGY_DRINK,1);

//Map
x_map = 0;
y_map = 0;

//Equipment
kevlar_isEquiped = 0;
kevlar_durability = 0;
helmet_isEquiped = 0;
helmet_durability = 0;

//Game
obj_game.player_max++;
obj_game.player_alive++;

gamepad_set_axis_deadzone(0,0.1);