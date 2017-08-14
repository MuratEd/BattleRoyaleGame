hsp = 0;
vsp = 0;
movesp = 4;

stamina = 1000;
stamina_max = 1000;
stamina_regen = 0;
stamina_cost = 0;
can_run = 1;

health_point = 18000;
health_max = 18000;
health_regen = 2;
can_regen = 1;
is_dead = 0;
can_move = 1;
blood_screen = 0;

player_kill = 0;

new_projectile = -1;
shot_cooldown = 0;
shot_cooldown_init = 150;
pointer_radius = 800;
projectile_damage = 7000;
projectile_speed = 30;

dir_cross = 0;
x_cross = 0;
y_cross = 0;

gamepad_set_axis_deadzone(0,0.1);
obj_game.player_max++;
obj_game.player_alive++;