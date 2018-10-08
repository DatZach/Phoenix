/// @func ability_draw_target_description(ability, source, target, left, top, right, bottom)
/// Draws an ability's target HUD
/// @param ability Ability

var ability = argument0;
var source = argument1;
var target = argument2;
var left = argument3;
var top = argument4;
var right = argument5;
var bottom = argument6;

var subs = ability[@ Ability.Sub];
for (var i = 0, isize = ds_list_size(subs); i < isize; ++i) {
	var sub = subs[| i];
	var offset = ability_sub_draw_target_description(ability, sub, source, target, left, top, right, bottom);
	if (is_real(offset))
		bottom += offset;
}
