/// @func FleeAbilitySub_draw_description(ability, left, top, right, bottom)
/// DRAW FleeAbility
/// @context mBattle

var ability = argument0;
var sub = argument1;
var left = argument2;
var top = argument3;
var right = argument4;
var bottom = argument5;

draw_set_color(c_white);
draw_text(left + 8, top + 40 + LINE_HEIGHT*0, "Attempt to escape from battle.");

return 40 + LINE_HEIGHT*0;