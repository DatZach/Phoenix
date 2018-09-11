/// @func skip_ability_create();
/// Creates a new SkipAbility
/// @returns SkipAbility

#macro ABILITY_SKIP 5

enum SkipAbility {
	size = ABILITY_SIZE //Ability.size, // TODO Find a way to uncomment this
}

var value = array_create(SkipAbility.size);
	value[@ Ability.Type] = ABILITY_SKIP;
	value[@ Ability.Name] = "Skip";
	value[@ Ability.RankMask] = 0x0F;
	value[@ Ability.TargetField] = FIELD_NONE;
	value[@ Ability.TargetMask] = 0x0F;

	value[@ Ability.FN_Use] = SkipAbility_use;
	value[@ Ability.FN_DrawDescription] = SkipAbility_draw_description;

return value;