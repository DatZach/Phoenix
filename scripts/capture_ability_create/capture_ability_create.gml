/// @func capture_ability_create();
/// Creates a new CaptureAbility
/// @returns CaptureAbility

#macro ABILITY_CAPTURE 3

enum CaptureAbility {
	size = ABILITY_SIZE //Ability.size, // TODO Find a way to uncomment this
}

var value = array_create(AttackAbility.size);
	value[@ Ability.Type] = ABILITY_CAPTURE;
	value[@ Ability.Name] = "undefined";
	value[@ Ability.RankMask] = 0x0F;
	value[@ Ability.TargetField] = FIELD_ALLY;
	value[@ Ability.TargetMask] = 0x01;

	value[@ Ability.FN_Use] = CaptureAbility_use;
	value[@ Ability.FN_Draw] = CaptureAbility_draw;

return value;