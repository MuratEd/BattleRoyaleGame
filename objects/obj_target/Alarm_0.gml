if (distance_to_object(obj_player) < 600)
{
	//Shooting toward player position
	audio_play_sound_at(snd_gunfire,x,y,0,1000,3000,1,0,0);
	new_projectile = instance_create_layer(x+60*cos(degtorad(point_direction(x,y,obj_player.x,obj_player.y))),y-60*sin(degtorad(point_direction(x,y,obj_player.x,obj_player.y))),"Projectiles",obj_projectile);
	new_projectile.shooter = self;
	new_projectile.spd = projectile_speed;
	new_projectile.dmg = projectile_damage;
	new_projectile.dis = projectile_distance;
	new_projectile.dir = point_direction(x,y,obj_player.x,obj_player.y);
}

//Reset shooting timer
alarm_set(0,irandom_range(projectile_cooldown-60,projectile_cooldown+60));