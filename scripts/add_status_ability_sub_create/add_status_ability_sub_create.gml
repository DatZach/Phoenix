/// @func add_status_ability_sub_create();
/// Creates a new AddStatus AbilitySub
/// @returns AddStatusAbilitySub

#macro ABILITY_SUB_ADD_STATUS 6

enum AddStatusAbilitySub {
	StatusEffect = ABILITY_SUB_SIZEOF,//AbilitySub.size, // TODO Find a way to uncomment this
	Accuracy,
	Turns,
	sizeof
}

var value = array_create(AddStatusAbilitySub.sizeof);
	value[@ AbilitySub.Type] = ABILITY_SUB_ADD_STATUS;
	value[@ AddStatusAbilitySub.StatusEffect] = STATUS_EFFECT_NONE;
	value[@ AddStatusAbilitySub.Accuracy] = 100;
	value[@ AddStatusAbilitySub.Turns] = 1;

	value[@ AbilitySub.FN_Use] = AddStatusAbilitySub_use;
	value[@ AbilitySub.FN_DrawDescription] = AddStatusAbilitySub_draw_description;

return value;