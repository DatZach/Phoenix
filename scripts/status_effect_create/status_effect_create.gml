/// @func status_effect_create();
/// Creates an empty StatusEffect
/// @returns StatusEffect

#macro STATUS_EFFECT_NONE 0

enum StatusEffect {
	Type,
	Turns,
	
	FN_Tick,
	
	size
}

show_error("Abstract class StatusEffect cannot be created.", true);
