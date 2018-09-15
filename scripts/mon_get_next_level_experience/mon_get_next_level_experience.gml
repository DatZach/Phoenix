/// @func mon_get_next_level_experience(monster)
/// Returns number of total experience points required for next level
/// @param monster Monster
/// @returns real

var monster = argument0;

// TODO Level Speed
return floor(4 * power(monster[@ k_mon.level] + 1, 3) / 5 * 100);
