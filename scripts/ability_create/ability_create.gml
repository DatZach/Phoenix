/// @func ability_create();
/// Creates base Ability struct
/// @returns Ability

#macro ABILITY_NONE 0

enum Ability {
	Type,					// real
	Key,					// string
	Name,					// string
	Dependencies,			// list<string>
	RankMask,				// real
	TargetField,			// real
	TargetMask,				// real
	StatusEffects,			// list<AbilityStatusEffect>
	
	FN_Use,					// script
	FN_DrawDescription,		// script
	
	size
}

#macro ABILITY_SIZE 9

show_error("Abstract class Ability cannot be created.", true);
