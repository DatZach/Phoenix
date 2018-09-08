/// @func ability_create();
/// Creates base Ability struct
/// @returns Ability

#macro ABILITY_NONE 0

enum Ability {
	Type,
	Name,
	Dependencies,
	RankMask,
	TargetField,
	TargetMask,
	
	FN_Use,
	FN_DrawDescription,
	
	size
}

#macro ABILITY_SIZE 8

show_error("Abstract class Ability cannot be created.", true);
