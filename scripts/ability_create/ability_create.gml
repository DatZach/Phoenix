/// @func ability_create();
/// Creates base Ability struct
/// @returns Ability

#macro ABILITY_NONE 0

enum Ability {
	Type,					// real
	Name,					// string
	Dependencies,			// list<string>
	RankMask,				// real
	TargetField,			// real
	TargetMask,				// real
	
	FN_Use,					// script
	FN_DrawDescription,		// script
	
	size
}

#macro ABILITY_SIZE 8

show_error("Abstract class Ability cannot be created.", true);
