//player pick up item
if(item_id != -1 && other.inputPickup)
{
	var item_count = ds_map_find_value(other.inventoryMap,item_id);
	ds_map_replace(other.inventoryMap,item_id,item_count+1);
	instance_destroy();
}