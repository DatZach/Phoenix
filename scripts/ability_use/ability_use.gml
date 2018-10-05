/// @func ability_use(ability, source, target)
/// Uses an ability on a target Monster given a source Monster
/// @param ability Ability
/// @param source Monster
/// @param target Monster

var ability = argument0;
var source = argument1;
var target = argument2;

var subs = ability[@ Ability.Sub];
for (var i = 0, isize = ds_list_size(subs); i < isize; ++i) {
	var sub = subs[| i];
	ability_sub_use(ability, sub, source, target);
}

// TODO Return value?
