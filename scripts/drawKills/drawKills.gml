kill = argument0;

draw_set_color(c_black);
draw_set_font(fnt_cocogoose20);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
if(kill>1)
{
	draw_text(20,40,string(kill)+" kills");
}
else
{
	draw_text(20,40,string(kill)+" kill");
}