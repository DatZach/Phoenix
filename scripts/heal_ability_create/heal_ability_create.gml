/// @func heal_ability_create();
/// Creates a new HealAbility
/// @returns HealAbility

#macro ABILITY_HEAL 2

enum HealAbility {
	Magnitude = 6,//Ability.size, // TODO Find a way to uncomment this
	size
}

var value = array_create(AttackAbility.size);
	value[@ Ability.Type] = ABILITY_HEAL;
	value[@ Ability.Name] = "undefined";
	value[@ Ability.RankMask] = 0x0F;
	value[@ Ability.TargetMask] = 0x0F;
	value[@ HealAbility.Magnitude] = 0;

	value[@ Ability.FN_Use] = HealAbility_use;

return value;