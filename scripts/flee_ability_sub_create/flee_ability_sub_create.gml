/// @func flee_ability_sub_create();
/// Creates a new Flee AbilitySub
/// @returns FleeAbilitySub

#macro ABILITY_SUB_FLEE 3

enum FleeAbilitySub {
	sizeof = AbilitySub.sizeof
}

var value = array_create(FleeAbilitySub.sizeof);
	value[@ AbilitySub.Type] = ABILITY_SUB_FLEE;

	value[@ AbilitySub.FN_Use] = FleeAbilitySub_use;
	value[@ AbilitySub.FN_DrawDescription] = FleeAbilitySub_draw_description;
	value[@ AbilitySub.FN_DrawTargetDescription] = noone;
return value;