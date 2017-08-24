//player pick up item
if(item_id != -1 && other.input_pickup)
{
	var item_count = ds_map_find_value(other.inventory_map,item_id);
	ds_map_replace(other.inventory_map,item_id,item_count+1);
	instance_destroy();
}