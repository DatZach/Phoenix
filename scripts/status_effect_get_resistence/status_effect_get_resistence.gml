/// @func status_effect_get_resistence(statusEffect, target)
/// Determines a target's resistence to a StatusEffect
/// @param statusEffect StatusEffect
/// @param target Monster
/// @returns real

var statusEffect = argument0;
var target = argument1;

var resistence;
switch(statusEffect[@ StatusEffect.Type]) {
	case STATUS_EFFECT_BLEED: resistence = mon_get_stat(target, k_stats.bleed_resist); break;
	case STATUS_EFFECT_POISON: resistence = mon_get_stat(target, k_stats.poison_resist); break;
	case STATUS_EFFECT_STUN: resistence = mon_get_stat(target, k_stats.stun_resist); break;
	case STATUS_EFFECT_MOVE: resistence = mon_get_stat(target, k_stats.move_resist); break;
	default:
		error(true, "Out of Range: ", statusEffect[@ StatusEffect.Type]);
}

// TODO Add target's buffs/debuffs

return resistence;
