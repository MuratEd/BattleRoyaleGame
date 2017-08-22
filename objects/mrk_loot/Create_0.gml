//Number of items to generate
gen_bandage = irandom_range(0,3);
gen_medickit = irandom_range(0,1);
gen_energydrink = irandom_range(0,2);
gen_energysnack = irandom_range(0,1);
gen_scope = irandom_range(0,1);
gen_laser = irandom_range(0,1);

for(var i = 0 ; i<gen_bandage ; i++)
{
	instance_create_layer(x+irandom_range(-5,5)*32, y+irandom_range(-5,5)*32, "Items",obj_bandage);
}
for(var i = 0 ; i<gen_medickit ; i++)
{
	instance_create_layer(x+irandom_range(-5,5)*32, y+irandom_range(-5,5)*32, "Items",obj_medickit);
}
for(var i = 0 ; i<gen_energydrink ; i++)
{
	instance_create_layer(x+irandom_range(-5,5)*32, y+irandom_range(-5,5)*32, "Items",obj_energydrink);
}
for(var i = 0 ; i<gen_energysnack ; i++)
{
	instance_create_layer(x+irandom_range(-5,5)*32, y+irandom_range(-5,5)*32, "Items",obj_energysnack);
}
for(var i = 0 ; i<gen_scope ; i++)
{
	instance_create_layer(x+irandom_range(-5,5)*32, y+irandom_range(-5,5)*32, "Items",obj_scope);
}
for(var i = 0 ; i<gen_laser ; i++)
{
	instance_create_layer(x+irandom_range(-5,5)*32, y+irandom_range(-5,5)*32, "Items",obj_laser);
}