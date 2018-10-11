/// @function mon_get_accuracy(monster, stat);
/// @param monster Monster
/// @param stat k_stats
/// Returns Accuracy stat
/// @returns real

var mon = argument0;
var stat = argument1;

var baseStats = mon[@ k_mon.base_stats];
var ivStats = mon[@ k_mon.iv_stats];
var modifier = 0;

// Modifier
var mStat = stat;
if (mStat == k_stats.min_damage || mStat == k_stats.max_damage)
	mStat = k_stats.strength;

var statusEffects = mon[@ k_mon.status_effects];
for(var i = 0, isize = ds_list_size(statusEffects); i < isize; ++i) {
	var statusEffect = statusEffects[| i];
	if (statusEffect[@ StatusEffect.Type] != STATUS_EFFECT_BUFF &&
		statusEffect[@ StatusEffect.Type] != STATUS_EFFECT_DEBUFF)
		continue;
	
	var seStats = statusEffect[@ BuffStatusEffect.Stats];
	modifier += seStats[mStat];
}

// Stat
switch(stat) {
	case k_stats.hp:
		return floor(baseStats[stat] + ivStats[stat] + modifier) + mon[k_mon.level];
	
	case k_stats.strength:
		assert(true, "Use min_damage or max_damage");
	case k_stats.min_damage:
		return floor(baseStats[k_stats.strength] + ivStats[k_stats.strength] + modifier);
	case k_stats.max_damage:
		return floor(baseStats[k_stats.strength] + ivStats[k_stats.strength] + modifier + mon[k_mon.level] + 2);
		
	default:
		return floor(baseStats[stat] + ivStats[stat] + modifier);
}
