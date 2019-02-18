if (hiveOffset > 20) {
	if (triggered) exit;
	
	var level = irandom_range(1, 2);
	var seed = irandom($7fffffff);
	var class = 1;
	
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
	
	var cpu = cpu_trainer_create();
	ds_list_add(cpu[k_trainer.party], mon);
	battle_create([oPlayer.player, cpu]);
	triggered = true;
}
else if (hiveOffset > 0)
	hiveOffset += 2;
	