//Draw Barrier Vignetting
barrier_screen = argument0;

draw_sprite_ext(spr_barrierscreen,0,window_get_width()/2,window_get_height()/2,1,1,0,c_white,barrier_screen);
barrier_screen -= 0.01;
if(barrier_screen<0) barrier_screen=0;

return barrier_screen;