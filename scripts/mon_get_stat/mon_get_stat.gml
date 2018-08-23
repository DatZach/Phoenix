/// @function mon_get_accuracy(monster, stat);
/// @param monster Monster
/// @param stat k_stats
/// Returns Accuracy stat
/// @returns real

var mon = argument0;
var stat = argument1;

var baseStats = mon[k_mon.base_stats];
var ivStats = mon[k_mon.iv_stats];
var modifier = 0; // TODO Implement

switch(stat) {
	case k_stats.hp:
		return floor(baseStats[stat] + ivStats[stat] + modifier) + mon[k_mon.level];
		
	default:
		return floor(baseStats[stat] + ivStats[stat] + modifier);
}
