input_pause = keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(0,gp_start);
input_exit = (pause && keyboard_check_pressed(vk_f12)) || (pause && gamepad_button_check_pressed(0,gp_select));
input_restart = keyboard_check_pressed(vk_backspace) || gamepad_button_check_pressed(0,gp_select);

last_player = (player_alive==1);

//Pause the game
if(input_pause)
{
	if(pause == 0) pause = 1;
	else pause = 0;
}

//Win the game
if(last_player)
{
	instance_destroy(obj_projectile);
}

//Restart the game
if(input_restart)
{
	game_restart();
}

//Quit the game
if(input_exit)
{
	game_end();
}