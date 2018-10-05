/// @func ability_sub_draw_description(ability, sub, left, top, right, bottom)
/// Draws an ability's HUD
/// @param ability Ability
/// @param sub AbilitySub

gml_pragma("forceinline");

var ability = argument0;
var sub = argument1;
var left = argument2;
var top = argument3;
var right = argument4;
var bottom = argument5;

return script_execute(sub[@ AbilitySub.FN_DrawDescription], ability, sub, left, top, right, bottom);
