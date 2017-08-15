draw_self();

//Crosshair
draw_set_color(c_red);
draw_sprite(spr_cross,0,x_cross,y_cross);
if(laser_radius) draw_line_width(x,y,x_cross,y_cross,2);

//God mode (TEST)
//if(instance_exists(obj_target))
//{
//	draw_line(x,y,instance_nearest(x,y,obj_target).x,instance_nearest(x,y,obj_target).y);
//}