view = argument0;
shake = argument1;
reduction = argument2;

view_xport[view] = irandom_range(-shake,shake);
view_yport[view] = irandom_range(-shake,shake);
shake *= 0.9;

if(shake<0.5) shake=0;

return shake;