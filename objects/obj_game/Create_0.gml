//Game status
game_on = 1;	//True when game is on
game_time = 0;
pause = 0;		//True when paused

//Count players
nb_player = 99;
player_max = 0;		//Number of player at the game start
player_alive = 0;	//Number of actual players alive in game

//Item ID
id_min = 10;

weapon_id_min = 10;
PISTOL = 10;
UMP = 11;
SHOTGUN = 12;
ASSAULT = 13;
SNIPER = 14;
MACHINEGUN = 15;
weapon_id_max = 15;

equipement_id_min = 30;
HELMET = 30;
KEVLAR = 31;
equipement_id_max = 31;

item_id_min = 40;
BANDAGE = 40;
MEDIC_KIT = 41;
ENERGY_DRINK = 42;
ENERGY_SNACK = 43;
SCOPE = 44;
LASER = 45;
item_id_max = 45;

id_max = 45;

//Item list
item_array[PISTOL] = obj_pistol;
item_array[UMP] = obj_ump;
item_array[SHOTGUN] = obj_shotgun;
item_array[ASSAULT] = obj_assault;
item_array[SNIPER] = obj_sniper;
item_array[MACHINEGUN] = obj_machinegun;

item_array[HELMET] = obj_helmet;
item_array[KEVLAR] = obj_kevlar;

item_array[BANDAGE] = obj_bandage;
item_array[MEDIC_KIT] = obj_medickit;
item_array[ENERGY_DRINK] = obj_energydrink;
item_array[ENERGY_SNACK] = obj_energysnack;
item_array[SCOPE] = obj_scope;
item_array[LASER] = obj_laser;


//Random generation
	//Generate World
var row;
var col;
for(col = 32 ; col <= room_width ; col = col + 64)
{
	for(row = 32 ; row <= room_height ; row = row + 64)
	{
		rdm = random_range(0,1);
		if(rdm < 0.004)
		{
			if(random_range(0,1) < 0.6) {
				instance_create_layer(row, col, "Terrain", obj_stone);
			}
			else
			{
				instance_create_layer(row, col, "Terrain", obj_tree);
			}
		}
		else if( 0.004<= rdm && rdm < 0.004+0.001)
		{
			instance_create_layer(row, col, "Marker", mrk_loot);
		}
	}
}
	//Generate Ennemies
for(var nb = 0 ; nb < nb_player ; nb++)
{
	instance_create_layer(irandom_range(20,room_width-20),irandom_range(20,room_height-20), "Player", obj_target);
}
	//Generate Player
instance_create_layer(irandom_range(20,room_width-20),irandom_range(20,room_height-20), "Player", obj_player);


//Game area
x_center = room_width/2;
y_center = room_height/2;
area_radius = (room_width/2)*1.414213;
area_damage = 2;
area_reduction = 0.7;
next_area_radius = area_radius*area_reduction;
process_resize = 0;

	//First reduction 3 minutes after the start
alarm_set(0,10800);