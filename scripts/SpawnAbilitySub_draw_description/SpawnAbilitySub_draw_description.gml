/// @func SpawnAbilitySub_draw_description(ability, sub, left, top, right, bottom)
/// DRAW SpawnAbility
/// @context mBattle

var ability = argument0;
var sub = argument1;
var left = argument2;
var top = argument3;
var right = argument4;
var bottom = argument5;

draw_set_color(c_white);
draw_text(left, top, "<NOT INTENDED FOR TAMEABLES>");

return LINE_HEIGHT*1;
