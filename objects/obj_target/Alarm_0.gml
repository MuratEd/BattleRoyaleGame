if (distance_to_object(nearest_ennemy) < 600 && speed == 0)
{
	//Shooting toward player position
	audio_play_sound_at(snd_gunfire,x,y,0,1000,3000,1,0,0);
	new_projectile = instance_create_layer(x+60*cos(degtorad(point_direction(x,y,nearest_ennemy.x,nearest_ennemy.y))),y-60*sin(degtorad(point_direction(x,y,nearest_ennemy.x,nearest_ennemy.y))),"Projectiles",obj_projectile);
	new_projectile.shooter = self;
	new_projectile.spd = projectile_speed;
	new_projectile.dmg = projectile_damage;
	new_projectile.dis = projectile_distance;
	new_projectile.dir = point_direction(x,y,nearest_ennemy.x,nearest_ennemy.y);
}

//Reset shooting timer
alarm_set(0,projectile_cooldown);