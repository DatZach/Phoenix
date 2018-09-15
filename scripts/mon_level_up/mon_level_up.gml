/// @func mon_level_up(monster);
/// Levels up a Monster
/// @param monster Monster

var mon = argument0;

mon[@ k_mon.level] += 1;
mon[@ k_mon.ap] += 1;

var stats = mon[@ k_mon.iv_stats];
stats[@ k_stats.strength] += (mon[@ k_mon.seed] & $1000) == 0 ? 1 : 1.25;		// Aggressive
stats[@ k_stats.protection] += (mon[@ k_mon.seed] & $800) == 0 ? 1 : 1.25;		// Gaurded
stats[@ k_stats.speed] += (mon[@ k_mon.seed] & $400) == 0 ? 1 : 1.25;			// Expedient?
stats[@ k_stats.accuracy] += (mon[@ k_mon.seed] & $200) == 0 ? 1 : 1.25;		// Dexterous
stats[@ k_stats.dodge] += (mon[@ k_mon.seed] & $100) == 0 ? 1 : 1.25;			// Reflexive

// TODO Prompt unlocking abilities

trace(mon_get_name(mon), " leveled up to ", mon[@ k_mon.level]);