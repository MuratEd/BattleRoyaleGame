health_point = 18000;
health_max = 18000;
health_regen = 4;
can_regen = 1;
is_dead = 0;

new_projectile = -1;
projectile_damage = 200;
projectile_speed = 30;

alarm_set(0,irandom_range(300,600));
obj_game.player_max++;
obj_game.player_alive++;