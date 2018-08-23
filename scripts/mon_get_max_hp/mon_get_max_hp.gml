/// @function mon_get_max_hp(monster);
/// Returns Max HP stat
/// @returns real

var mon = argument0;

var baseStats = mon[k_mon.base_stats];
var ivStats = mon[k_mon.iv_stats];
var modifier = 0; // TODO Implement

return floor(baseStats[k_stats.hp] + ivStats[k_stats.hp] + modifier) + mon[k_mon.level];
