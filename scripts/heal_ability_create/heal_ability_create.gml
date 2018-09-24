/// @func heal_ability_create();
/// Creates a new HealAbility
/// @returns HealAbility

#macro ABILITY_HEAL 2

enum HealAbility {
	Magnitude = ABILITY_SIZE,//Ability.size, // TODO Find a way to uncomment this
	size
}

var value = array_create(AttackAbility.size);
	value[@ Ability.Type] = ABILITY_HEAL;
	value[@ Ability.Key] = "";
	value[@ Ability.Name] = "undefined";
	value[@ Ability.Dependencies] = noone;
	value[@ Ability.RankMask] = 0x0F;
	value[@ Ability.TargetField] = FIELD_ALLY;
	value[@ Ability.TargetMask] = 0x0F;
	value[@ HealAbility.Magnitude] = 0;

	value[@ Ability.FN_Use] = HealAbility_use;
	value[@ Ability.FN_DrawDescription] = HealAbility_draw_description;

return value;