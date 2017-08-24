//Initialization
name = "Target";

//Health
health_point = 10000;
health_max = 10000;
health_regen = 1;
can_regen = 1;

//Projectiles
new_projectile = -1;
last_projectile_hit = -1;
projectile_damage = irandom_range(100,2000);
projectile_speed = 30;
projectile_distance = projectile_damage*2;
projectile_cooldown = projectile_damage/70;

//Statistics
player_kill = 0;

//AI
direction = irandom_range(0,360);
speed = 4;
	//1: Agressive, 0: Defensive
comportement = irandom_range(0,1);
	//Aggressive : [600-1800]   &   Defensive : [300-900]
sight = 300 * irandom_range(1,3) * (comportement+1);
	//Aggressive : [500-1000]   &   Defensive : [2000-5000]
health_limit = irandom_range(500,1000) - (comportement-1) * irandom_range(1500,4000);
ennemy_insight = 0;

//Game
obj_game.player_max++;
obj_game.player_alive++;

//Alarm 0 : Shooting timer
alarm_set(0,300);