if (awards != noone) {
	var key = ds_map_find_first(awards);
	for (var i = 0, size = ds_map_size(awards); i < size; ++i) {
		ds_list_destroy(awards[? key]);
		key = ds_map_find_next(awards, key);
	}
	
	awards = noone;
}

state_machine_cleanup();