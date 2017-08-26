//Player pick up kevlar
if (equipment_id != -1 && other.inputPickup)
{
	other.kevlarEquiped = 1;
	other.kevlarDurability = 100;
	instance_destroy();
	
}