if (hiveOffset > 20) {
	if (triggered) exit;

	var cpu = cpu_trainer_create();
	
		var mon;
		mon = mon_create();
		mon_initialize(mon, "Bee", 1);
		ds_list_add(cpu[k_trainer.party], mon);
		
		mon = mon_create();
		mon_initialize(mon, "BeeHive", 1);
		ds_list_add(cpu[k_trainer.party], mon);
		
	battle_create([oPlayer.trainer, cpu]);
	triggered = true;
}
else if (hiveOffset > 0)
	hiveOffset += 2;
