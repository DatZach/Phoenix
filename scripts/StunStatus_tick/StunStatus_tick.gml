/// @desc StunStatus_tick(statusEffect, target)
/// Derrived StatusEffect.Tick
/// @this StunStatusEffect
/// @param statusEffect StatusEffect
/// @param target Monster

var statusEffect = argument0;
var target = argument1;

if (statusEffect[@ StatusEffect.Turns] - 1 <= 0) {
	// TODO Add 1 turn buff for improving stun resist
}

return true;
