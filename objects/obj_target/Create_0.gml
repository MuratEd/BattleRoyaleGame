//Health
health_point = 10000;
health_max = 10000;
health_regen = 2;
can_regen = 1;

//Projectiles
new_projectile = -1;
last_projectile_hit = -1;
projectile_damage = 1500;
projectile_speed = 30;
projectile_distance = 4000;

//Statistics
player_kill = 0;

//Game
obj_game.player_max++;
obj_game.player_alive++;

//Alarm 0 : Shooting timer
alarm_set(0,irandom_range(1500,5000));