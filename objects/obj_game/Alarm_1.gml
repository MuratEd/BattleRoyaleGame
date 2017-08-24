//Smooth reduction to the next area
area_radius -= 5;

if(area_radius <= next_area_radius)
{
	next_area_radius = area_radius * area_reduction;
	process_resize = 0;
	alarm_set(0,5400);
}
else
{
	process_resize = 1;
	alarm_set(1,2);
}