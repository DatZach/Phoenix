/// @func debuff_status_effect_create(turns, stats);
/// Creates a DebuffStatusEffect
/// @param turns real
/// @param stats Stats
/// @returns DebuffStatusEffect

#macro STATUS_EFFECT_DEBUFF 6

enum DebuffStatusEffect {
	Stats = STATUS_EFFECT_SIZEOF,//StatusEffect.size, // TODO Find a way to uncomment this
	sizeof
}

var turns = argument0;
var stats = argument1;

var statusEffect = array_create(DebuffStatusEffect.sizeof);
	statusEffect[@ StatusEffect.Type] = STATUS_EFFECT_DEBUFF;
	statusEffect[@ StatusEffect.Turns] = turns;
	statusEffect[@ DebuffStatusEffect.Stats] = stats;
	
	statusEffect[@ StatusEffect.FN_Tick] = noone;
return statusEffect;
