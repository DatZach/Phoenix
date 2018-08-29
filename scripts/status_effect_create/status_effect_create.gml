/// @func status_effect_create();
/// Creates an empty StatusEffect
/// @returns StatusEffect

enum StatusEffect {
	Type,
	Turns,
	
	FN_Tick,
	
	size
}

show_error("Abstract class StatusEffect cannot be created.", true);
