if (equipment_id != -1 && other.input_pickup)
{
	other.kevlar_isEquiped = 1;
	other.kevlar_durability = 100;
	instance_destroy();
	
}