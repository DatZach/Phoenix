/// @func SkipAbility_draw_description(ability, left, top, right, bottom)
/// DRAW SkipAbility
/// @context mBattle

var ability = argument0;
var left = argument1;
var top = argument2;
var right = argument3;
var bottom = argument4;

draw_set_color(c_white);
draw_text(left + 8, top + 40 + LINE_HEIGHT*0, "Skip turn");
