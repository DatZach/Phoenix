/// @func move_ability_create([distance, rank]);
/// Creates a new MoveAbility
/// @param distance real Optional
/// @param rank real Optional (Required if distance set)
/// @returns MoveAbility

#macro ABILITY_MOVE 4

enum MoveAbility {
	Distance = ABILITY_SIZE,
	size
}

var distance = argument_count > 0 ? argument[0] : 0;
var position = argument_count > 0 ? argument[1] : 0;

var mask = (((1 << (distance+1)) - 1) << position) | (1<<max(0, position-1));

var value = array_create(MoveAbility.size);
	value[@ Ability.Type] = ABILITY_MOVE;
	value[@ Ability.Key] = "";
	value[@ Ability.Name] = "Move";
	value[@ Ability.Dependencies] = noone;
	value[@ Ability.RankMask] = 0x0F;
	value[@ Ability.TargetField] = FIELD_ALLY;
	value[@ Ability.TargetMask] = mask;
	value[@ MoveAbility.Distance] = distance;

	value[@ Ability.FN_Use] = MoveAbility_use;
	value[@ Ability.FN_DrawDescription] = MoveAbility_draw_description;

return value;