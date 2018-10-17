/// @desc Spawn

var shouldSpawn = randchance(chance);
if (shouldSpawn) {
	var xx, yy;
	do {
		xx = irandom_range(bbox_left, bbox_right);
		yy = irandom_range(bbox_top, bbox_bottom);
	} until(true);//until (!collision_at(xx, yy));
	
	var class = choosearr(species);
	var level = irandom_range(levelRange[0], levelRange[1]);
	var seed = irandom($7fffffff);
	
	var mon = mon_create();
	mon_set_seed(mon, class, seed);
	mon[@ k_mon.experience] = mon_get_level_experience(mon, level);
	repeat(level) mon_level_up(mon);
	mon[@ k_mon.hp] = mon_get_max_hp(mon);
	
	// TODO Correctly resolve abilities properly for a level
	var dbMonster = global.dbMonsters[| class];
	var dbAbilities = dbMonster[@ k_db_mon.abilities];
	var abilities = mon[@ k_mon.abilities];
		abilities[@ 0] = dbAbilities[? ds_map_find_first(dbAbilities)];
	
	//for (var i = 0, isize = ds_map_size(dbAbilities); i < isize; ++i) {
	//	var abilityKey = ds_map_find_first(dbAbilities);
	//}
	
	var inst = instance_create_layer(xx, yy, LAYER_INSTANCES, oMonster);
	inst.monster = mon;
	
	trace("Spawned lv. ", level, " ", mon_get_name(mon));
}

alarm[0] = TARGET_FPS;
