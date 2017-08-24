x_player = argument0;
y_player = argument1;
kill = argument2;

//Initialisation ----------------------------
draw_set_color(c_white);
draw_set_font(fnt_cocogoose20);
draw_set_valign(fa_center);




//Left alignement ---------------------------
draw_set_halign(fa_left);

draw_text(1500,100,"X :");
draw_text(1500,140,"Y :");
draw_text(1500,220,"Kill :");



//Right alignement --------------------------
draw_set_halign(fa_right);

draw_text(1900,100,string(floor(x_player/100)-(room_width/200)));
draw_text(1900,140,string(-floor(y_player/100)+(room_height/200)));
draw_text(1900,220,string(kill));