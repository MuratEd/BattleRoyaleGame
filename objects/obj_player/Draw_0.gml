draw_self();

#region Crosshair
draw_set_color(c_red);
if(inputAim)
{
	draw_sprite_ext(spr_cross,0,crossX,crossY,scope,scope,0,c_white,1);
	if(laser) draw_line_width(x,y,crossX,crossY,1.5*scope);
}
else
{
	draw_sprite_ext(spr_cross,0,crossX,crossY,1,1,0,c_white,1);
}

#endregion

/*
#region God mode (test)
if(instance_exists(obj_target))
{
	draw_line(x,y,instance_nearest(x,y,obj_target).x,instance_nearest(x,y,obj_target).y);
}

#endregion
*/