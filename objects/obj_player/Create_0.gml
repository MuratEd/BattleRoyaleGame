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
is_dead = 0;

//Stamina
stamina = 1000;
stamina_max = 1000;
stamina_regen = 0;
stamina_cost = 0;

//Health
health_point = 10000;
health_max = 10000;
health_regen = 2;
headshot_dmg = 3;
blood_screen = 0;

//Statistics
player_kill = 0;
rank_def = 0;

//Projectiles
new_projectile_fire = -1;	//Newest projectile that player has fired
last_projectile_hit = -1;	//Lastest projectile that player has hit
shot_cooldown = 0;
projectile_damage = irandom_range(200,10000);
shot_cooldown_init = projectile_damage/70;
projectile_speed = 30;
projectile_distance = projectile_damage*2;

//Weapons
pointer_radius = 100 + irandom_range(0,9)*(projectile_damage/100);
laser_radius = irandom_range(0,1);
scope = irandom_range(2,6)/2;

//Crosshair
dir_cross = 0;
x_cross = 0;
y_cross = 0;

//Game
obj_game.player_max++;
obj_game.player_alive++;

gamepad_set_axis_deadzone(0,0.1);