/// @func battle_awards_distribute_experience()
/// Distributes experience given award map. Cleans up rewards to prevent
//  accidental redistribution.
/// @context mBattle

if (awards == noone)
	return;

var key = ds_map_find_first(awards);
for (var i = 0, isize = ds_map_size(awards); i < isize; ++i) {
	if (key[@ k_mon.dead])
		continue;
	
	var experience = 0;
	var list = awards[? key];
	for (var j = 0, jsize = ds_list_size(list); j < jsize; ++j) {
		var award = list[| j];
		experience += battle_award_get_experience(award);
	}
	
	trace("Awarding ", mon_get_name(key), " ", experience, "xp");
	mon_experience_add(key, experience);
	
	key = ds_map_find_next(awards, key);
}

battle_awards_cleanup();
