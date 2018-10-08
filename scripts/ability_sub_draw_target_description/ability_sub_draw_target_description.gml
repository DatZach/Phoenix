/// @func ability_sub_draw_target_description(ability, sub, source, target, left, top, right, bottom)
/// Draws an ability's HUD
/// @param ability Ability
/// @param sub AbilitySub

gml_pragma("forceinline");

var ability = argument0;
var sub = argument1;
var source = argument2;
var target = argument3;
var left = argument4;
var top = argument5;
var right = argument6;
var bottom = argument7;

var fn = sub[@ AbilitySub.FN_DrawTargetDescription];
if (script_exists(fn))
	return script_execute(fn, ability, sub, source, target, left, top, right, bottom);

return 0;
