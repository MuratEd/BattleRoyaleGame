//audio_play_sound(snd_gunfire,0,0);

//Shooting toward player position
new_projectile = instance_create_layer(x+60*cos(degtorad(point_direction(x,y,obj_player.x,obj_player.y))),y-60*sin(degtorad(point_direction(x,y,obj_player.x,obj_player.y))),"Projectiles",obj_projectile);
new_projectile.shooter = self;
new_projectile.spd = projectile_speed;
new_projectile.dmg = projectile_damage;
new_projectile.dis = projectile_distance;
new_projectile.dir = point_direction(x,y,obj_player.x,obj_player.y);

//Reset shooting timer
alarm_set(0,irandom_range(1500,5000));