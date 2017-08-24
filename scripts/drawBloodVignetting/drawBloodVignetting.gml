blood_screen = argument0;

draw_sprite_ext(spr_bloodscreen,0,window_get_width()/2,window_get_height()/2,1,1,0,c_white,blood_screen);
blood_screen -= 0.01;
if(blood_screen<0) blood_screen=0;