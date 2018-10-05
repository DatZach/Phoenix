/// @func heal_ability_create();
/// Creates a new HealAbility
/// @returns HealAbility

#macro ABILITY_SUB_HEAL 2

enum HealAbilitySub {
	Magnitude = ABILITY_SUB_SIZEOF,//AbilitySub.size, // TODO Find a way to uncomment this
	sizeof
}

var value = array_create(HealAbilitySub.sizeof);
	value[@ AbilitySub.Type] = ABILITY_SUB_DAMAGE;
	value[@ HealAbilitySub.Magnitude] = 100;

	value[@ AbilitySub.FN_Use] = HealAbilitySub_use;
	value[@ AbilitySub.FN_DrawDescription] = HealAbilitySub_draw_description;

return value;