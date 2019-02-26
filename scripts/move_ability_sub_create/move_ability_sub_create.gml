/// @func move_ability_sub_create()
/// Creates a new Move AbilitySub
/// @returns MoveAbilitySub

#macro ABILITY_SUB_MOVE 5

enum MoveAbilitySub {
	Distance = AbilitySub.sizeof,
	sizeof
}

var value = array_create(MoveAbilitySub.sizeof);
	value[@ AbilitySub.Type] = ABILITY_SUB_MOVE;
	value[@ MoveAbilitySub.Distance] = 0;

	value[@ AbilitySub.FN_Use] = MoveAbilitySub_use;
	value[@ AbilitySub.FN_DrawDescription] = MoveAbilitySub_draw_description;
	value[@ AbilitySub.FN_DrawTargetDescription] = noone;

return value;