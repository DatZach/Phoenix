/// @func capture_ability_sub_create();
/// Creates a new Capture AbilitySub
/// @returns CaptureAbilitySub

#macro ABILITY_SUB_CAPTURE 4

enum CaptureAbilitySub {
	sizeof = ABILITY_SUB_SIZEOF
}

var value = array_create(CaptureAbilitySub.sizeof);
	value[@ AbilitySub.Type] = ABILITY_SUB_CAPTURE;

	value[@ AbilitySub.FN_Use] = CaptureAbilitySub_use;
	value[@ AbilitySub.FN_DrawDescription] = CaptureAbilitySub_draw_description;
return value;