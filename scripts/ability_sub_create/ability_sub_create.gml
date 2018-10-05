/// @func ability_sub_create()
/// Creates a new Ability sub
/// @returns AbilitySub

#macro ABILITY_SUB_NONE 0

enum AbilitySub {
	Type,
	
	FN_Use,
	FN_DrawDescription,
	
	sizeof
}

#macro ABILITY_SUB_SIZEOF 4

error(true, "Cannot create abstract class AbilitySub");
