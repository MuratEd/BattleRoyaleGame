draw_self();

//Draw Health
	//Health bar
draw_set_color(c_black);
draw_rectangle(x-21,y-46,x+21,y-39,0);
draw_set_color(c_maroon);
draw_rectangle(x-20,y-45,health_point*(40/health_max)+(x-20),y-40,0);
	//Health value
draw_set_color(c_white);
draw_set_font(fnt_cocogoose5);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(x,y-41,string(health_point));

//Draw Name
draw_set_color(c_black);
draw_set_font(fnt_cocogoose12);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(x,y-60,string(name));




//draw_set_color(c_black);
//draw_set_font(fnt_cocogoose12);
//draw_set_alpha(1);
//draw_set_halign(fa_center);
//draw_set_valign(fa_center);
//draw_text(x,y-60,string(nearest_ennemy_dist));

//if(!ennemy_insight) draw_set_color(c_blue);
//else draw_set_color(c_red);
//draw_circle(x,y,sight,1);

//if(sight>projectile_distance) draw_circle_color(x,y,projectile_distance,c_black,c_black,1);

//draw_set_color(c_blue);
//draw_circle(x,y,projectile_distance,1);

//draw_set_color(c_red);
//draw_line_width(x,y,nearest_ennemy.x,nearest_ennemy.y,8);
