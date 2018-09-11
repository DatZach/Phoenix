/// @func move_ability_create();
/// Creates a new MoveAbility
/// @returns MoveAbility

#macro ABILITY_MOVE 4

enum MoveAbility {
	Distance = ABILITY_SIZE,
	size
}

var value = array_create(MoveAbility.size);
	value[@ Ability.Type] = ABILITY_MOVE;
	value[@ Ability.Name] = "Move";
	value[@ Ability.RankMask] = 0x0F;
	value[@ Ability.TargetField] = FIELD_ALLY;
	value[@ Ability.TargetMask] = 0x0F;
	value[@ MoveAbility.Distance] = 0;

	value[@ Ability.FN_Use] = MoveAbility_use;
	value[@ Ability.FN_DrawDescription] = MoveAbility_draw_description;

return value;