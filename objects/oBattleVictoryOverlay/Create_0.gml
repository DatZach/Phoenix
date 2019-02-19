phase = 0;
awards = ds_map_create();

var key = ds_map_find_first(mBattle.awards);
for (var i = 0, isize = ds_map_size(mBattle.awards); i < isize; ++i) {
	ds_map_add(awards, key, ds_list_create());
	key = ds_map_find_next(mBattle.awards, key);
}

io_clear();

alarm[0] = 6;

depth = -1001;
