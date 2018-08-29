/// @func mon_find_status_effect(monster, statusEffectType)
/// Returns a StatusEffect or noone
/// @param monster Monster
/// @param statusEffectType StatusEffect.Type

var monster = argument0;
var statusEffectType = argument1;

var statusEffects = monster[@ k_mon.status_effects];
for (var i = 0, len = ds_list_size(statusEffects); i < len; ++i) {
	var statusEffect = statusEffects[| i];
	if (statusEffect[@ StatusEffect.Type] == statusEffectType)
		return statusEffect;
}

return noone;
