/// @func stun_status_effect_create(turns);
/// Creates a StunStatusEffect
/// @returns StunStatusEffect

#macro STATUS_EFFECT_STUN 2

enum StunStatusEffect {
	size = 4,//StatusEffect.size, // TODO Find a way to uncomment this
}

var turns = argument0;

var statusEffect = array_create(StunStatusEffect.size);
	statusEffect[@ StatusEffect.Type] = STATUS_EFFECT_STUN;
	statusEffect[@ StatusEffect.Turns] = turns;
	
	statusEffect[@ StatusEffect.FN_Tick] = StunStatus_tick;
return statusEffect;
