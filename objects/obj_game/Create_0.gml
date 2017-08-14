pause = 0;
last_player = 0;

player_max = 0;
player_alive = 0;

var row;
var col;
for(col = 32 ; col <= 10048 ; col = col + 64)
{
	for(row = 32 ; row <= 10048 ; row = row + 64)
	{
		rdm = random_range(0,1);
		if(rdm < 0.003)
		{
			instance_create_layer(row, col, "Terrain", obj_stone);
		}
		else if( 0.003<= rdm && rdm < 0.003+0.004)
		{
			instance_create_layer(row, col, "Target", obj_target);
		}
	}
}