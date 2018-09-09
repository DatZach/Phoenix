/// @func ability_draw_description(ability, left, top, right, bottom)
/// Draws an ability's HUD
/// @param ability Ability

gml_pragma("forceinline");

var ability = argument0;
var left = argument1;
var top = argument2;
var right = argument3;
var bottom = argument4;

return script_execute(ability[@ Ability.FN_DrawDescription], ability, left, top, right, bottom);