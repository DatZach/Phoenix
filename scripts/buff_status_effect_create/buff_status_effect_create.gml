/// @func buff_status_effect_create(turns, stats);
/// Creates a BuffStatusEffect
/// @param turns real
/// @param stats Stats
/// @returns BuffStatusEffect

#macro STATUS_EFFECT_BUFF 5

enum BuffStatusEffect {
	Stats = STATUS_EFFECT_SIZEOF,//StatusEffect.size, // TODO Find a way to uncomment this
	sizeof
}

var turns = argument0;
var stats = argument1;

var statusEffect = array_create(BuffStatusEffect.sizeof);
	statusEffect[@ StatusEffect.Type] = STATUS_EFFECT_BUFF;
	statusEffect[@ StatusEffect.Turns] = turns;
	statusEffect[@ BuffStatusEffect.Stats] = stats;
	
	statusEffect[@ StatusEffect.FN_Tick] = noone;
return statusEffect;
