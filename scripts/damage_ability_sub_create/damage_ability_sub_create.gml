/// @func damage_ability_sub_create();
/// Creates a new Damage AbilitySub
/// @returns DamageAbilitySub

#macro ABILITY_SUB_DAMAGE 1

enum DamageAbilitySub {
	Accuracy = ABILITY_SUB_SIZEOF,//AbilitySub.size, // TODO Find a way to uncomment this
	DamageModifier,
	CriticalModifier,
	sizeof
}

var value = array_create(DamageAbilitySub.sizeof);
	value[@ AbilitySub.Type] = ABILITY_SUB_DAMAGE;
	value[@ DamageAbilitySub.Accuracy] = 100;
	value[@ DamageAbilitySub.DamageModifier] = 1;
	value[@ DamageAbilitySub.CriticalModifier] = 0;

	value[@ AbilitySub.FN_Use] = DamageAbilitySub_use;
	value[@ AbilitySub.FN_DrawDescription] = DamageAbilitySub_draw_description;
	value[@ AbilitySub.FN_DrawTargetDescription] = DamageAbilitySub_draw_target_description;

return value;