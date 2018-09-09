var player = player_trainer_create();
var trainer = mon_create();
	mon_set_seed(trainer, 0, randint());
	repeat (1) mon_level_up(trainer);
	trainer[@ k_mon.hp] = mon_get_max_hp(trainer);
	
	var dbMonster = global.dbMonsters[| 0];
	var dbAbilities = dbMonster[@ k_db_mon.abilities];
	var abilities = trainer[@ k_mon.abilities];
		abilities[@ 0] = dbAbilities[? "Shank"];
		abilities[@ 1] = dbAbilities[? "Heal1"];
		abilities[@ 2] = dbAbilities[? "Capture"];
		abilities[@ 3] = dbAbilities[? "Flee"];
player[@ k_trainer.trainer] = trainer;
var chimaera = mon_create();
	mon_set_seed(chimaera, 1, randint());
	repeat (3) mon_level_up(chimaera);
	chimaera[@ k_mon.hp] = mon_get_max_hp(chimaera);
	
	var dbMonster = global.dbMonsters[| 1];
	var dbAbilities = dbMonster[@ k_db_mon.abilities];
	var abilities = chimaera[@ k_mon.abilities];
		abilities[@ 0] = dbAbilities[? "Bite"];
		abilities[@ 1] = dbAbilities[? "Rush"];
ds_list_add(player[k_trainer.party], chimaera);

var cpu = cpu_trainer_create();
var trainer = mon_create();
	mon_set_seed(trainer, 0, randint());
	repeat (1) mon_level_up(trainer);
	trainer[@ k_mon.hp] = mon_get_max_hp(trainer);
	
	var dbMonster = global.dbMonsters[| 0];
	var dbAbilities = dbMonster[@ k_db_mon.abilities];
	var abilities = trainer[@ k_mon.abilities];
		abilities[@ 0] = dbAbilities[? "Shank"];
		abilities[@ 1] = dbAbilities[? "Heal1"];
		abilities[@ 2] = dbAbilities[? "Capture"];
		abilities[@ 3] = dbAbilities[? "Flee"];
cpu[@ k_trainer.trainer] = trainer;
var nix = mon_create();
	mon_set_seed(nix, 2, randint());
	repeat (1) mon_level_up(nix);
	nix[@ k_mon.hp] = mon_get_max_hp(nix);
	
	var dbMonster = global.dbMonsters[| 2];
	var dbAbilities = dbMonster[@ k_db_mon.abilities];
	var abilities = nix[@ k_mon.abilities];
		abilities[@ 0] = dbAbilities[? "Scratch"];
ds_list_add(cpu[k_trainer.party], nix);
var nix = mon_create();
	mon_set_seed(nix, 2, randint());
	repeat (1) mon_level_up(nix);
	nix[@ k_mon.hp] = mon_get_max_hp(nix);
	
	var dbMonster = global.dbMonsters[| 2];
	var dbAbilities = dbMonster[@ k_db_mon.abilities];
	var abilities = nix[@ k_mon.abilities];
		abilities[@ 0] = dbAbilities[? "Scratch"];
ds_list_add(cpu[k_trainer.party], nix);
var nix = mon_create();
	mon_set_seed(nix, 2, randint());
	repeat (1) mon_level_up(nix);
	nix[@ k_mon.hp] = mon_get_max_hp(nix);
	
	var dbMonster = global.dbMonsters[| 2];
	var dbAbilities = dbMonster[@ k_db_mon.abilities];
	var abilities = nix[@ k_mon.abilities];
		abilities[@ 0] = dbAbilities[? "Scratch"];
ds_list_add(cpu[k_trainer.party], nix);
var nix = mon_create();
	mon_set_seed(nix, 2, randint());
	repeat (1) mon_level_up(nix);
	nix[@ k_mon.hp] = mon_get_max_hp(nix);
	
	var dbMonster = global.dbMonsters[| 2];
	var dbAbilities = dbMonster[@ k_db_mon.abilities];
	var abilities = nix[@ k_mon.abilities];
		abilities[@ 0] = dbAbilities[? "Scratch"];
ds_list_add(cpu[k_trainer.party], nix);

var battle = battle_create([player, cpu]);
