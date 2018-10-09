/// @func status_effect_get_resistence(statusEffect, target)
/// Determines a target's resistence to a StatusEffect
/// @param statusEffect StatusEffect
/// @param target Monster
/// @returns real

var statusEffect = argument0;
var target = argument1;

var stat;
switch(statusEffect[@ StatusEffect.Type]) {
	case STATUS_EFFECT_BLEED: stat = k_stats.bleed_resist; break;
	case STATUS_EFFECT_POISON: stat = k_stats.poison_resist; break;
	case STATUS_EFFECT_STUN: stat = k_stats.stun_resist; break;
	case STATUS_EFFECT_MOVE: stat = k_stats.move_resist; break;
	case STATUS_EFFECT_GUARD:
	case STATUS_EFFECT_BUFF:
	case STATUS_EFFECT_DEBUFF:
		stat = noone;
		break;
	default:
		error(true, "Out of Range: ", statusEffect[@ StatusEffect.Type]);
}

if (stat == noone)
	return 0;

// Resistence
var resistence = mon_get_stat(target, stat);

// Modifier
var statusEffects = target[@ k_mon.status_effects];
for(var i = 0, isize = ds_list_size(statusEffects); i < isize; ++i) {
	var statusEffect = statusEffects[| i];
	if (statusEffect != STATUS_EFFECT_BUFF && statusEffect != STATUS_EFFECT_DEBUFF)
		continue;
	
	var seStats = statusEffect[@ BuffStatusEffect.Stats];
	resistence += seStats[stat];
}

return resistence;
