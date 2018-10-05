/// @func ability_draw_description(ability, left, top, right, bottom)
/// Draws an ability's HUD
/// @param ability Ability

var ability = argument0;
var left = argument1;
var top = argument2;
var right = argument3;
var bottom = argument4;

var subs = ability[@ Ability.Sub];
for (var i = 0, isize = ds_list_size(subs); i < isize; ++i) {
	var sub = subs[| i];
	var offset = ability_sub_draw_description(ability, sub, left, top, right, bottom);
	if (is_real(offset))
		bottom += offset;
}
