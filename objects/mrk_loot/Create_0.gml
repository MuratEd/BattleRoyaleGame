for(var i = -5 ; i <= 5 ; i++)
{
	for (var j = -5 ; j <= 5 ; j++)
	{
		if(random_range(0,1) < 0.05) 
		{
			instance_create_layer(x+i *32, y+j *32, "Items", obj_game.item_array[irandom_range(obj_game.item_id_min,obj_game.item_id_max)]);
		}
	}
}