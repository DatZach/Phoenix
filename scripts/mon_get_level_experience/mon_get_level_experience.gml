/// @func mon_get_level_experience(monster, level)
/// Returns the amount of experience required to be at a specified level
/// @param monster Monster
/// @param level real
/// @returns real

var monster = argument0;
var level = argument1;

// TODO Level Speed
return floor(4 * power(level, 3) / 5 * 100);
