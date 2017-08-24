//Player pick up helmet
if (equipment_id != -1 && other.input_pickup)
{
	other.helmet_isEquiped = 1;
	other.helmet_durability = 50;
	instance_destroy();
	
}