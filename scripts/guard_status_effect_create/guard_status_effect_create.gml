/// @func guard_status_effect_create(turns, guardian);
/// Creates a GuardStatusEffect
/// @param turns real
/// @param guardian Monster
/// @returns GuardStatusEffect

#macro STATUS_EFFECT_GUARD 4

enum GuardStatusEffect {
	Guardian = STATUS_EFFECT_SIZEOF,//StatusEffect.size, // TODO Find a way to uncomment this
	sizeof
}

var turns = argument0;
var guardian = argument1;

var statusEffect = array_create(GuardStatusEffect.sizeof);
	statusEffect[@ StatusEffect.Type] = STATUS_EFFECT_GUARD;
	statusEffect[@ StatusEffect.Turns] = turns;
	statusEffect[@ GuardStatusEffect.Guardian] = guardian;
	
	statusEffect[@ StatusEffect.FN_Tick] = noone;
return statusEffect;
