/// @func mon_experience_add(monster, value)
/// Adds value to monster's experience. Levels monster up if applicable.
/// @param monster Monster
/// @param value real

var monster = argument0;
var value = argument1;

monster[@ k_mon.experience] += value;

while (mon_get_level_experience(monster, monster[@ k_mon.level] + 1) <= monster[@ k_mon.experience])
	mon_level_up(monster);
