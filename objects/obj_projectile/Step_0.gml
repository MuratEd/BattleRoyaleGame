//Distance
if(distance_travel < dis)
{
	distance_travel += spd;
}
else 
{
	instance_destroy();
}

//Colisions
if(place_meeting(x,y,par_collision))
{
	instance_destroy();
}

//Movement
image_angle = dir;
x = x + ((cos(degtorad(dir)))*spd);
y = y - ((sin(degtorad(dir)))*spd);