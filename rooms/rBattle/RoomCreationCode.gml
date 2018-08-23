var player = player_trainer_create();
	var chimaera = mon_create();
	mon_set_seed(chimaera, 0, randint());
ds_list_add(player[k_trainer.party], chimaera);

var cpu = cpu_trainer_create();
	var nix = mon_create();
	mon_set_seed(nix, 1, randint());
ds_list_add(cpu[k_trainer.party], nix);

var battle = battle_create([player, cpu]);
