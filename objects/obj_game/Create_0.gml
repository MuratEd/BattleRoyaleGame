//Game status
game_on = 1;	//True when game is on
pause = 0;		//True when paused

//Count players
player_max = 0;		//Number of player at the game start
player_alive = 0;	//Number of actual players alive in game

//Random generation
var row;
var col;
for(col = 32 ; col <= 10048 ; col = col + 64)
{
	for(row = 32 ; row <= 10048 ; row = row + 64)
	{
		rdm = random_range(0,1);
		if(rdm < 0.003) //0.3% to generate a rock
		{
			instance_create_layer(row, col, "Terrain", obj_stone);
		}
		else if( 0.003<= rdm && rdm < 0.003+0.004) //0.4% chance to generate an ennemy
		{
			instance_create_layer(row, col, "Target", obj_target);
		}
	}
}