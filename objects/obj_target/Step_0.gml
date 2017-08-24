//Hit detection
	//Body hit
mask_index = spr_targetby;
if(place_meeting(x,y,obj_projectile))
{
	last_projectile_hit = instance_nearest(x,y,obj_projectile);
	health_point -= last_projectile_hit.dmg;
	if(health_point <= 0) last_projectile_hit.shooter.player_kill++;
	audio_play_sound_at(snd_hit,self.x,self.y,0,0,3000,1,0,0);
	instance_destroy(last_projectile_hit);
}
	
	//Headshot
mask_index = spr_targeths;
if(place_meeting(x,y,obj_projectile))
{
	last_projectile_hit = instance_nearest(x,y,obj_projectile);
	health_point -= last_projectile_hit.dmg*3;
	if(health_point <= 0) last_projectile_hit.shooter.player_kill++;
	audio_play_sound_at(snd_hit,self.x,y,0,0,3000,1,0,0);
	audio_play_sound_at(snd_ding,self.x,self.y,0,0,3000,1,0,0);
	instance_destroy(last_projectile_hit);
}
	//Reset collision mask
mask_index = spr_target;

//Area detection
if(point_distance(x,y,obj_game.x_center,obj_game.y_center) > obj_game.area_radius)
{
	health_point -= obj_game.area_damage;
	
}

//Health
	//When 0HP
if(health_point<=0)
{
	instance_deactivate_object(self);
	object_set_visible(self,false);
	obj_game.player_alive--;
}
	//Regeneration of health
if(health_point<health_max && can_regen) health_point += health_regen;
	//Overflow management
if(health_point>health_max) health_point = health_max;
if(health_point<0) health_point = 0;

nearest_target = instance_nth_nearest(x,y,obj_target,2);
nearest_player = instance_nth_nearest(x,y,obj_player,1);
nearest_target_dist = point_distance(x,y,nearest_target.x,nearest_target.y);
nearest_player_dist = point_distance(x,y,nearest_player.x,nearest_player.y);

if(nearest_target_dist<nearest_player_dist)
{
	nearest_ennemy = nearest_target;
	nearest_ennemy_dist = nearest_target_dist;
}
else
{
	nearest_ennemy = nearest_player;
	nearest_ennemy_dist = nearest_player_dist;
}


if(nearest_ennemy_dist<sight)
{
	ennemy_insight = 1;
}
else
{
	ennemy_insight = 0;
}

//Movement
var rdm = random_range(0,1);

if(ennemy_insight && distance_to_object(nearest_ennemy) > projectile_distance-100)
{
	direction = point_direction(x,y,nearest_ennemy.x,nearest_ennemy.y);
	speed = 4;
}
else if(ennemy_insight && distance_to_object(nearest_ennemy) < projectile_distance-100)
{
	speed = 0;
}
else if(!ennemy_insight && point_distance(x,y,obj_game.x_center,obj_game.y_center) > obj_game.area_radius && rdm<0.1)
{
	direction = point_direction(x,y,obj_game.x_center,obj_game.y_center);
	speed = 4;
}
else if(!ennemy_insight && rdm<0.1) 
{
	direction = direction + irandom_range(-20,20);
	speed = 4;
}