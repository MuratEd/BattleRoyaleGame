#region Inputs

//Movement inputs
inputLeft = gamepad_axis_value(0,gp_axislh)<-leftDeadzone || keyboard_check(ord("Q"));
inputRight = gamepad_axis_value(0,gp_axislh)>leftDeadzone || keyboard_check(ord("D"));
inputUp = gamepad_axis_value(0,gp_axislv)<-leftDeadzone || keyboard_check(ord("Z"));
inputDown = gamepad_axis_value(0,gp_axislv)>leftDeadzone || keyboard_check(ord("S"));

//Action inputs
inputRun = gamepad_button_check(0,gp_shoulderlb) || gamepad_button_check(0,gp_shoulderrb) || keyboard_check(vk_shift);
inputShot = gamepad_button_check(0,gp_shoulderr) || mouse_check_button(mb_left);
inputAim = gamepad_button_check(0,gp_shoulderl) || mouse_check_button(mb_right);
inputPickup = gamepad_button_check_pressed(0,gp_face1) || keyboard_check(ord("F"));;
inputUse = gamepad_button_check_pressed(0,gp_face2) || keyboard_check_pressed(ord("A"));
inputMap = gamepad_button_check_pressed(0,gp_face3) || keyboard_check_pressed(ord("X"));

//Fast inventory inputs
inputInvLeft = gamepad_button_check_pressed(0,gp_padl) || keyboard_check_pressed(ord("C")); //Items
inputInvRight = gamepad_button_check_pressed(0,gp_padr) || keyboard_check_pressed(ord("E")); //Items
inputInvUp = gamepad_button_check_pressed(0,gp_padu) || mouse_wheel_up(); //Weapons
inputInvDown = gamepad_button_check_pressed(0,gp_padd) || mouse_wheel_down(); //Weapons

//Game management inputs
inputPause = gamepad_button_check_pressed(0,gp_start) || keyboard_check_pressed(vk_escape);
inputExit = (showPause && gamepad_button_check_pressed(0,gp_select)) || (showPause && keyboard_check_pressed(vk_f12));
inputRestart = gamepad_button_check_pressed(0,gp_select) || keyboard_check_pressed(vk_backspace);



//For smoother movement with gamepad
//https://docs.google.com/document/d/1lZmQleJxKYYW0evvt4t5k2_MgOFSSlhdPbmkVTa1SPU/edit?pageId=107174476290112596279

#endregion

#region Forcing inputs

//Forced inputs when paused
if(showPause)
{
	inputLeft = 0;
	inputRight = 0;
	inputUp = 0;
	inputDown = 0;
	inputRun = 0;
	inputShot = 0;
	inputPickup = 0;
	inputUse = 0;
	inputInvLeft = 0;
	inputInvRight = 0;
	inputInvUp = 0;
	inputInvDown = 0;
	inputRestart = 0;
}

//Forced inputs when dead
if(isDead)
{
	inputLeft = 0;
	inputRight = 0;
	inputUp = 0;
	inputDown = 0;
	inputRun = 0;
	inputShot = 0;
	inputPickup = 0;
	inputUse = 0;
	inputInvLeft = 0;
	inputInvRight = 0;
	inputInvUp = 0;
	inputInvDown = 0;
}

#endregion

#region Taking damage

//If player alive : Take damages from projectiles, barrier
if(!isDead)
{
	//Check projectile hit in the body
	mask_index = spr_playerby;
	if(place_meeting(x,y,obj_projectile) && !isDead)
	{
		//Tracking the projectile that hitted the player
		lastProjectileHit = instance_nearest(x,y,obj_projectile);
		
		//If protection equiped : Reduce damage and decrease durability
		if (kevlarEquiped == 1)
		{
			healthPoint -= floor(lastProjectileHit.dmg * obj_kevlar.reduction);
			kevlarDurability -= 1;
		}
		//If no protection equiped :
		else
		{
			healthPoint -= lastProjectileHit.dmg;	
		}
	
		//Display blood vignetting
		bloodScreen = 1;
		shake = 5;
	
		//Destroy projectile tracked
		instance_destroy(lastProjectileHit);
	}

	//Check projectile hit in the head
	mask_index = spr_playerhs;
	if(place_meeting(x,y,obj_projectile) && !isDead)
	{
		//Tracking the projectile that hitted the player
		lastProjectileHit = instance_nearest(x,y,obj_projectile);
		
		//If protection equiped : Reduce damage and decrease durability
		if (helmetEquiped == 1)
		{
			healthPoint -= floor(lastProjectileHit.dmg * obj_helmet.reduction * lastProjectileHit.hsdmg);
			helmetDurability -= 1;
		}
		//If no protection equiped :
		else
		{
			healthPoint -= lastProjectileHit.dmg * lastProjectileHit.hsdmg;	
		}
	
		//Display blood vignetting
		bloodScreen = 1;
		shake = 5;
	
		//Destroy projectile tracked
		instance_destroy(lastProjectileHit);
	}
	
	//Reset collision mask
	mask_index = spr_player;

	//Check player position in game area
	if(point_distance(x,y,obj_game.x_center,obj_game.y_center)>obj_game.area_radius)
	{
		healthPoint -= obj_game.area_damage;
		barrierScreen = 1;
	}
}
if(shake != 0)
{
	shake = shakeScreen(0,shake,0.5);
}

#endregion

#region Equipment

//Check if equipement has durability remaining
kevlarEquiped = (kevlarDurability > 0);
helmetEquiped = (helmetDurability > 0);

#endregion

#region Run / Stamina use

//If player can run
if(canRun)
{
	//If player wants run
	if(inputRun)
	{
		mvsp = runsp;
		staminaPoint -= 0.6;
	}
	//If player won't run
	else
	{
		mvsp = walksp;
		staminaRegen = 0.1;
	}
}
//If player can't run
else
{
	mvsp = slowsp;
	staminaRegen = 0.1;
}

#endregion

#region Stamina

//If player alive : Regenerate stamina
if(staminaPoint<=staminaMax && !isDead) staminaPoint += staminaRegen;

//Overflow management : if (Stamina over StaminaMax) or (Stamina under 0)
if(staminaPoint>staminaMax) staminaPoint = staminaMax;
if(staminaPoint<0) staminaPoint = 0;

#endregion

#region Health

//If player died : Stop player
if(healthPoint<=0 && !isDead)
{
	isDead = 1;
	canMove = 0;
	canRun = 0;
	canRegen = 0;
	canUseItem = 0;
	healthPoint = 0;
	stamina = 0;
	//Save his rank & remove him to the player counter
	rankDef = obj_game.player_alive;
	obj_game.player_alive--;
}

//If player alive : Regenerate (not used)
if(healthPoint<healthMax && !isDead) healthPoint += floor(healthRegen);
	
//Overflow management : if (HP over HPmax) or (HP under 0)
if(healthPoint>healthMax) healthPoint = healthMax;
if(healthPoint<0) healthPoint = 0;

#endregion

#region Inventory selection

//Roll items selection
if(inputInvLeft && itemSelected != obj_game.item_id_min)
{
	itemSelected--;
}
if(inputInvRight && itemSelected != obj_game.item_id_max)
{
	itemSelected++;
}

//Roll weapon selection
if(inputInvUp && weaponSelected != obj_game.weapon_id_max)
{
	weaponSelected++;
	
	//Update projectile statistics
	projectileDamage = obj_game.item_array[weaponSelected].damage;
	projectileHeadshot = obj_game.item_array[weaponSelected].hs_damage;
	projectileSpeed = obj_game.item_array[weaponSelected].spd;
	projectileDistance = obj_game.item_array[weaponSelected].distance;
}
if(inputInvDown && weaponSelected != obj_game.weapon_id_min)
{
	weaponSelected--;
	
	//Update projectile statistics
	projectileDamage = obj_game.item_array[weaponSelected].damage;
	projectileHeadshot = obj_game.item_array[weaponSelected].hs_damage;
	projectileSpeed = obj_game.item_array[weaponSelected].spd;
	projectileDistance = obj_game.item_array[weaponSelected].distance;
}

projectileDamage = obj_game.item_array[weaponSelected].damage;
projectileHeadshot = obj_game.item_array[weaponSelected].hs_damage;
projectileSpeed = obj_game.item_array[weaponSelected].spd;
projectileDistance = obj_game.item_array[weaponSelected].distance;

#endregion

#region Item using

//If plaver alive, has at least 1 items selected, want use it :
if(inputUse && ds_map_find_value(inventoryMap,itemSelected) != 0 && !isDead)
{
	//Remove 1 item
	ds_map_replace(inventoryMap,itemSelected,ds_map_find_value(inventoryMap,itemSelected)-1);
	
	//Apply item effect
	switch(itemSelected)
	{
		case obj_game.BANDAGE:
			healthPoint += 200;
			break;
		case obj_game.MEDIC_KIT:
			healthMax += 500;
			healthPoint += 500;
			break;
		case obj_game.ENERGY_DRINK:
			staminaPoint += 500;
			break;
		case obj_game.ENERGY_SNACK:
			staminaMax += 200;
			staminaPoint += 600;
			break;
		case obj_game.SCOPE:
			if(scope<3) scope += 0.2;
			if(crossRadius<=1000) crossRadius += 50;
			break;
		case obj_game.LASER:
			laser = 1;
			if(crossRadius<=1000) crossRadius += 50;
			break;
	}
}

#endregion

#region Map

//Update player position on the map
mapX = x/room_width*1040;
mapY = y/room_height*1040;

//Show map - hide map
if(inputMap)
{
	if(showMap) showMap=0;
	else showMap=1;
}

#endregion

#region Zoom

//If aim : zoom out
if(inputAim)
{
	camera_set_view_size(view_camera[0],window_get_width()*scope,window_get_height()*scope);
}
//If not aim : reset zoom
else
{
	camera_set_view_size(view_camera[0],window_get_width(),window_get_height());
}

#endregion

#region Crosshair

//If gamepad connected and play with gamepad
if (gamepad_is_connected(0) && playController)
{
	//If gamepad right joystick has change : Update crosshair position
	if(!(gamepad_axis_value(0,gp_axisrh)<0.05 && gamepad_axis_value(0,gp_axisrh)>-0.05) || !(gamepad_axis_value(0,gp_axisrv)<0.05 && gamepad_axis_value(0,gp_axisrv)>-0.05))
	{
		crossDirection = point_direction(0,0,gamepad_axis_value(0,gp_axisrh),gamepad_axis_value(0,gp_axisrv));
		crossX = x+crossRadius*cos(degtorad(crossDirection));
		crossY = y-crossRadius*sin(degtorad(crossDirection));
	}
	//If no changes : crosshair follows the player
	else
	{
		crossX = crossX + hsp;
		crossY = crossY + vsp;
	}
}
//If gamepad not connected or play without gamepad
else
{
	crossDirection = point_direction(x,y,mouse_x,mouse_y);
	crossX = mouse_x;
	crossY = mouse_y;
}

#endregion

#region Shoting

//Reduce cooldown
if(shotCooldown != 0)
{
	shotCooldown--;
}

//If cooldown up, player alive, want fire
if(inputShot && !shotCooldown && !isDead)
{
	audio_play_sound_at(snd_gunfire,self.x,self.y,0,0,3000,1,0,0);
	
	//Set statistics of the projectile
	newProjectileFire = instance_create_layer(x+60*cos(degtorad(crossDirection)),y-60*sin(degtorad(crossDirection)),"Projectiles",obj_projectile);
	newProjectileFire.direction = crossDirection;
	newProjectileFire.shooter = self;
	newProjectileFire.spd = projectileSpeed;
	newProjectileFire.dmg = projectileDamage;
	newProjectileFire.hsdmg = projectileHeadshot;
	newProjectileFire.dis = projectileDistance;
	newProjectileFire.dir = point_direction(obj_player.x, obj_player.y, obj_player.crossX, obj_player.crossY);
	
	//Set cooldown
	shotCooldown = obj_game.item_array[weaponSelected].cooldown;
}

#endregion

#region Player status
	//Can run ?
if(staminaPoint<=0) canRun = 0;
if(!canRun && staminaPoint>staminaMax*0.25) canRun = 1;
	
	//Pause the game
if(inputPause)
{
	if(showPause == 0) showPause = 1;
	else showPause = 0;
}
	//Restart the game
if(inputRestart)
{
	game_restart();
}
	//Quit the game
if(inputExit)
{
	game_end();
}

#endregion

#region Movement

//Update horizontal and vertical speed
var hm = (inputRight - inputLeft);
hsp = hm * mvsp;

var vm = (inputDown - inputUp);
vsp = vm * mvsp;

//If horizontal collisions : Cancel horizontal moving
if(place_meeting(x+hsp,y,par_collision))
{
	while(!place_meeting(x+sign(hsp),y,par_collision))
	{
		x = x + sign(hsp)
	}
	hsp = 0;
}

//If vertical collisions : Cancel vertical moving
if(place_meeting(x,y+vsp,par_collision))
{
	while(!place_meeting(x,y+sign(vsp),par_collision))
	{
		y = y + sign(vsp)
	}
	vsp = 0;
}

//If player is dead : Cancel all movements
if(isDead)
{
	hsp = 0;
	vsp = 0;
}

//Apply movement
x = x + hsp;
y = y + vsp;

#endregion

#region Animation


#endregion