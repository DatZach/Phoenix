/// @func move_ability_sub_create()
/// Creates a new Move AbilitySub
/// @returns MoveAbilitySub

#macro ABILITY_SUB_MOVE 5

enum MoveAbilitySub {
	sizeof = ABILITY_SUB_SIZEOF //AbilitySub.size, // TODO Find a way to uncomment this
}

var value = array_create(MoveAbilitySub.sizeof);
	value[@ AbilitySub.Type] = ABILITY_SUB_MOVE;

	value[@ AbilitySub.FN_Use] = MoveAbilitySub_use;
	value[@ AbilitySub.FN_DrawDescription] = MoveAbilitySub_draw_description;

return value;