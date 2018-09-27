/// @desc PoisonStatus_tick(statusEffect, target)
/// Derrived StatusEffect.Tick
/// @this PoisonStatusEffect
/// @param statusEffect StatusEffect
/// @param target Monster

var this = argument0;
var target = argument1;

battle_monster_harm(target, this[@ PoisonStatusEffect.Strength]);
