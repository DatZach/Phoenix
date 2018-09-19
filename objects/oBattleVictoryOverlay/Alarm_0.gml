/// @desc Tick awards displaying

var fCount = 0;

var key = ds_map_find_first(mBattle.awards);
for (var i = 0, isize = ds_map_size(mBattle.awards); i < isize; ++i) {
	var sourceList = mBattle.awards[? key];
	var destList = awards[? key];
	
	var idx = ds_list_size(destList);
	if (idx < ds_list_size(sourceList))
		ds_list_add(destList, sourceList[| idx]);
	
	key = ds_map_find_next(mBattle.awards, key);
}

//if (fCount <= isize)
	alarm[0] = 6;
