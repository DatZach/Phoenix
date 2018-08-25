/// @func ability_create();
/// Creates base Ability struct
/// @returns Ability

#macro ABILITY_NONE 0

enum Ability {
	Type,
	Name,
	RankMask,
	TargetMask,
	
	FnUse,
	
	size
}

show_error("Abstract class Ability cannot be created.", true);
