//Movement
hsp = 0;
vsp = 0;
mvsp = 0;
walksp = 4;
runsp = 7;
slowsp = 2;

//Player status
canMove = 1;
canRun = 1;
canRegen = 1;
canUseItem = 1;
isDead = 0;

//GUI status
bloodScreen = 0;
barrierScreen = 0;
showPause = 0;
showMap = 0;

//Stamina
staminaPoint = 100;
staminaMax = 100;
staminaRegen = 0;

//Health
healthPoint = 1000;
healthMax = 1000;
healthRegen = 0;

//Statistics
kill = 0;
rankDef = 1;

//Projectiles
newProjectileFire = -1;	//Newest projectile that player has fired
lastProjectileHit = -1;	//Lastest projectile that player has hit
shotCooldown = 0;
projectileDamage = 0;
projectileHeadshot = 0;
projectileSpeed = 0;
projectileDistance = 0;

//Weapon equipement
laser = 0;
scope = 1;

//Crosshair
crossRadius = 100;
crossDirection = 0;
crossX = x + 100;
crossY = y;

//Inventory
itemSelected = obj_game.item_id_min;
weaponSelected = obj_game.weapon_id_min;

inventoryMap = ds_map_create();
for(var item_id = obj_game.item_id_min ; item_id<=obj_game.item_id_max ; item_id++)
{
	ds_map_add(inventoryMap,item_id,0);
}
ds_map_replace(inventoryMap,obj_game.BANDAGE,5);
ds_map_replace(inventoryMap,obj_game.ENERGY_DRINK,1);

//Map
mapX = 0;
mapY = 0;

//Equipment
kevlarEquiped = 0;
kevlarDurability = 0;
helmetEquiped = 0;
helmetDurability = 0;

//Game
obj_game.player_max++;
obj_game.player_alive++;

leftDeadzone = 0.5;
rightDeadzone = 0.02;
gamepad_set_axis_deadzone(0,min(leftDeadzone,rightDeadzone));