//Game status
game_on = 1;	//True when game is on
game_time = 0;
pause = 0;		//True when paused

//Count players
nb_player = 20;
player_max = 0;		//Number of player at the game start
player_alive = 0;	//Number of actual players alive in game

//Weapons
weapon_id_min = 10;

PISTOL = 10;
weapon_array[PISTOL] = obj_pistol;
UMP = 11;
weapon_array[UMP] = obj_ump;
SHOTGUN = 12;
weapon_array[SHOTGUN] = obj_shotgun;
ASSAULT = 13;
weapon_array[ASSAULT] = obj_assault;
SNIPER = 14;
weapon_array[SNIPER] = obj_sniper;
MACHINEGUN = 15;
weapon_array[MACHINEGUN] = obj_machinegun;

weapon_id_max = 15;

//Items
item_id_min = 10;

BANDAGE = 10;
item_array[BANDAGE] = obj_bandage;
MEDIC_KIT = 11;
item_array[MEDIC_KIT] = obj_medickit;
ENERGY_DRINK = 12;
item_array[ENERGY_DRINK] = obj_energydrink;
ENERGY_SNACK = 13;
item_array[ENERGY_SNACK] = obj_energysnack;
SCOPE = 14;
item_array[SCOPE] = obj_scope;
LASER = 15;
item_array[LASER] = obj_laser;

item_id_max = 15;

//Equipments
equipment_id_min = 10;

KEVLAR = 10;
equipment_array[KEVLAR] = obj_kevlar;
HELMET = 11;
equipment_array[HELMET] = obj_helmet;

equipment_id_max = 11;


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
	//First reduction 3 minutes after the start
alarm_set(0,10800);