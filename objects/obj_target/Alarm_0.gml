//audio_play_sound(snd_gunfire,0,0);

new_projectile = instance_create_layer(x+60*cos(degtorad(point_direction(x,y,obj_player.x,obj_player.y))),y-60*sin(degtorad(point_direction(x,y,obj_player.x,obj_player.y))),"Projectiles",obj_projectile);
new_projectile.shooter = self;
new_projectile.spd = projectile_speed;
new_projectile.dmg = projectile_damage;
new_projectile.dir = point_direction(x,y,obj_player.x,obj_player.y);

alarm_set(0,irandom_range(150,400));