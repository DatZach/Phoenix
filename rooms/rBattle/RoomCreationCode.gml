var player = player_trainer_create();
	var chimaera = mon_create();
	mon_set_seed(chimaera, 0, randint());
	chimaera[@ k_mon.hp] = mon_get_max_hp(chimaera);
	
	var abilities = chimaera[@ k_mon.abilities];
	var aBite = attack_ability_create();
		aBite[@ Ability.Name] = "Bite";
		aBite[@ Ability.RankMask] = 0x03;
		aBite[@ Ability.TargetMask] = 0x01;
		aBite[@ AttackAbility.Accuracy] = 90;
	abilities[@ 0] = aBite;
ds_list_add(player[k_trainer.party], chimaera);

var cpu = cpu_trainer_create();
	var nix = mon_create();
	mon_set_seed(nix, 1, randint());
	nix[@ k_mon.hp] = mon_get_max_hp(nix);
ds_list_add(cpu[k_trainer.party], nix);

var battle = battle_create([player, cpu]);
