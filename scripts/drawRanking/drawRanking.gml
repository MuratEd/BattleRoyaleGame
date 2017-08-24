//Draw Ranking
draw_set_color(c_black);
draw_set_font(fnt_cocogoose20);
draw_set_halign(fa_right);
draw_set_valign(fa_center);
draw_text(window_get_width()-40,40,string(obj_game.player_alive)+"/"+string(obj_game.player_max));