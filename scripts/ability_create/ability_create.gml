/// @func ability_create();
/// Creates base Ability struct
/// @returns Ability

enum Ability {
	//Type,					// real
	Key,					// string
	Name,					// string
	Dependencies,			// list<string>
	RankMask,				// real
	TargetField,			// real
	TargetMask,				// real
	Sub,					// list<AbilitySub> TODO Come up with a better name
	
	//FN_Use,					// script
	//FN_DrawDescription,		// script
	
	sizeof
}

#macro ABILITY_SIZE 8

var value = array_create(Ability.sizeof);
	value[@ Ability.Key] = "";
	value[@ Ability.Name] = "undefined";
	value[@ Ability.Dependencies] = noone;
	value[@ Ability.RankMask] = 0x0F;
	value[@ Ability.TargetField] = FIELD_FOE;
	value[@ Ability.TargetMask] = 0x0F;
	value[@ Ability.Sub] = ds_list_create();
return value;
