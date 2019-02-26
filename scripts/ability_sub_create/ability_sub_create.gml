/// @func ability_sub_create()
/// Creates a new Ability sub
/// @returns AbilitySub

#macro ABILITY_SUB_NONE 0

enum AbilitySub {
	Type,
	
	FN_Use,
	FN_DrawDescription,
	FN_DrawTargetDescription,
	
	sizeof
}

error(true, "Cannot create abstract class AbilitySub");
