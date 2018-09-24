/// @func flee_ability_create();
/// Creates a new FleeAbility
/// @returns FleeAbility

#macro ABILITY_FLEE 3

enum FleeAbility {
	size = ABILITY_SIZE //Ability.size, // TODO Find a way to uncomment this
}

var value = array_create(AttackAbility.size);
	value[@ Ability.Type] = ABILITY_FLEE;
	value[@ Ability.Key] = "";
	value[@ Ability.Name] = "undefined";
	value[@ Ability.Dependencies] = noone;
	value[@ Ability.RankMask] = 0x0F;
	value[@ Ability.TargetField] = FIELD_NONE;
	value[@ Ability.TargetMask] = 0x00;

	value[@ Ability.FN_Use] = FleeAbility_use;
	value[@ Ability.FN_DrawDescription] = FleeAbility_draw_description;

return value;