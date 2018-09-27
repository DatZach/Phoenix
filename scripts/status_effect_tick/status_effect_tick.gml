/// @func status_effect_tick(statusEffect, target);
/// Ticks a StatusEffect
/// @param statusEffect StatusEffect
/// @param target Monster

var statusEffect = argument0;
var target = argument1;

// Base tick
statusEffect[@ StatusEffect.Turns] -= 1;
if (statusEffect[@ StatusEffect.Turns] <= 0) {
	ds_list_delete_value(target[@ k_mon.status_effects], statusEffect);
	return false;
}

// Derrived tick
if (script_exists(statusEffect[@ StatusEffect.FN_Tick]))
	return script_execute(statusEffect[@ StatusEffect.FN_Tick], statusEffect, target);

return false;
