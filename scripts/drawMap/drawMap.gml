//Draw Map
x_map_player = argument0;
y_map_player = argument1;

draw_set_color(c_black);
draw_set_alpha(0.4);
draw_rectangle(0,0,room_width,room_height,0);
draw_set_color(c_green);
draw_set_alpha(1);
draw_rectangle(440,20,440+window_get_width()-880,20+window_get_height()-40,0);	
draw_set_color(c_red);
draw_circle(440+x_map_player,20+y_map_player,5,0);
draw_set_color(c_blue);
draw_circle(440+(obj_game.x_center/room_width*1040),20+(obj_game.y_center/room_height*1040),obj_game.area_radius/room_width*1040,1);
draw_set_color(c_white);
draw_circle(440+(obj_game.x_center/room_width*1040),20+(obj_game.y_center/room_height*1040),(obj_game.next_area_radius)/room_width*1040,1);