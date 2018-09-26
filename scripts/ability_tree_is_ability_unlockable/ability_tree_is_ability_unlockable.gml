/// @func ability_tree_is_ability_unlockable(monster, ability)
/// Returns if an ability is unlockable for a Monster
/// @param monster Monster
/// @param ability Ability
/// @returns bool

var monster = argument0;
var ability = argument1;

var dependencies = ability[@ Ability.Dependencies];
if (ds_exists(dependencies, ds_type_list)) {
	for (var j = 0, jsize = ds_list_size(dependencies); j < jsize; ++j) {
		var dependency = dependencies[| j];
		if (ds_list_find_index(monster[@ k_mon.unlocked_abilities], dependency) == -1)
			return false;
	}
}

return true;
