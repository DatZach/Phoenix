/// @desc BleedStatus_tick(statusEffect, target)
/// Derrived StatusEffect.Tick
/// @this BleedStatusEffect
/// @param statusEffect StatusEffect
/// @param target Monster

var this = argument0;
var target = argument1;

battle_monster_harm(target, this[@ BleedStatusEffect.Strength]);
