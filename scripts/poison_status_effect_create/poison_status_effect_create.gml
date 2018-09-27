/// @func poison_status_effect_create(turns, strength);
/// Creates a PoisonStatusEffect
/// @returns PoisonStatusEffect

#macro STATUS_EFFECT_POISON 1

enum PoisonStatusEffect {
	Strength = 4,//StatusEffect.size, // TODO Find a way to uncomment this
	
	size
}

var turns = argument0;
var strength = argument1;

var statusEffect = array_create(PoisonStatusEffect.size);
	statusEffect[@ StatusEffect.Type] = STATUS_EFFECT_POISON;
	statusEffect[@ StatusEffect.Turns] = turns;
	statusEffect[@ PoisonStatusEffect.Strength] = strength;
	
	statusEffect[@ StatusEffect.FN_Tick] = PoisonStatus_tick;
return statusEffect;
