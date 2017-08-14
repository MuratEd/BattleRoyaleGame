if(obj_game.pause) exit;


//Hit detection
mask_index = spr_targetby;
if(place_meeting(x,y,obj_projectile) && !is_dead)
{
	var projectile_hit = instance_nearest(x,y,obj_projectile);
	health_point -= projectile_hit.dmg;
	audio_play_sound(snd_hit,0,0);
	instance_destroy(projectile_hit);
}
mask_index = spr_targeths;
if(place_meeting(x,y,obj_projectile) && !is_dead)
{
	var projectile_hit = instance_nearest(x,y,obj_projectile);
	health_point -= projectile_hit.dmg*3;
	audio_play_sound(snd_hit,0,0);
	audio_play_sound(snd_ding,0,0);
	instance_destroy(projectile_hit);
}
mask_index = spr_target;

//Health
if(health_point<health_max && can_regen) health_point += health_regen;		//Regeneration of health
if(health_point>health_max) health_point = health_max;
if(health_point<0) health_point = 0;
//When no more HP
if(health_point==0 && !is_dead)
{
	instance_destroy();
	obj_game.player_alive--;
	obj_player.player_kill++
}