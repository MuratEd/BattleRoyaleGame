//Game status
game_on = 1;	//True when game is on
pause = 0;		//True when paused

//Count players
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


//Random generation
var row;
var col;
for(col = 32 ; col <= 10048 ; col = col + 64)
{
	for(row = 32 ; row <= 10048 ; row = row + 64)
	{
		rdm = random_range(0,1);
		if(rdm < 0.003) //0.3% to generate a rock
		{
			instance_create_layer(row, col, "Terrain", obj_stone);
		}
		else if( 0.003<= rdm && rdm < 0.003+0.004) //0.4% chance to generate an ennemy
		{
			instance_create_layer(row, col, "Target", obj_target);
		}
		else if( 0.007<= rdm && rdm < 0.007+0.006)
		{
			instance_create_layer(row, col, "Items", item_array[irandom_range(item_id_min,item_id_max)]);
		}
	}
}