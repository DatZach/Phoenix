/// @desc Select random target tree

target = instance_nth_nearest(x, y, oTree, irandom(instance_number(oTree)));

alarm[0] = irandom_range(TARGET_FPS*2, TARGET_FPS*10);
