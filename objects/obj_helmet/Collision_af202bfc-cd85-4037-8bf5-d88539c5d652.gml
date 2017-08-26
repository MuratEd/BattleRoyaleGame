//Player pick up helmet
if (equipment_id != -1 && other.inputPickup)
{
	other.helmetEquiped = 1;
	other.helmetDurability = 50;
	instance_destroy();
	
}