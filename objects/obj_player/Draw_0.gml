draw_self();

//Crosshair
draw_set_color(c_red);
if(input_aim)
{
	draw_sprite_ext(spr_cross,0,x_cross,y_cross,scope,scope,0,c_white,1);
	if(laser_radius) draw_line_width(x,y,x_cross,y_cross,1.5*scope);
}
else
{
	draw_sprite_ext(spr_cross,0,x_cross,y_cross,1,1,0,c_white,1);
	if(laser_radius) draw_line_width(x,y,x_cross,y_cross,2);
}

//God mode (TEST)
//if(instance_exists(obj_target))
//{
//	draw_line(x,y,instance_nearest(x,y,obj_target).x,instance_nearest(x,y,obj_target).y);
//}