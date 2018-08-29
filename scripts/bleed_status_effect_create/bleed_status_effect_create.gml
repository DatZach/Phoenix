/// @func bleed_status_effect_create(turns, strength);
/// Creates a BleedStatusEffect
/// @returns BleedStatusEffect

#macro STATUS_EFFECT_BLEED 0

enum BleedStatusEffect {
	Strength = 4,//StatusEffect.size, // TODO Find a way to uncomment this
	
	size
}

var turns = argument0;
var strength = argument1;

var statusEffect = array_create(BleedStatusEffect.size);
	statusEffect[@ StatusEffect.Type] = STATUS_EFFECT_BLEED;
	statusEffect[@ StatusEffect.Turns] = turns;
	statusEffect[@ BleedStatusEffect.Strength] = strength;
	
	statusEffect[@ StatusEffect.FN_Tick] = BleedStatus_tick;
return statusEffect;
