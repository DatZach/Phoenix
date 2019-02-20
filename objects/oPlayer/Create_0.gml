/// @desc Initialize

// Configuration
event_inherited();
maxspd = 85;
accel = 85;
fric = 0.2;

image_speed = 0;
image_index = 1;

trainer = player_trainer_create();
var mon = mon_create();
	mon_set_seed(mon, 0, randint());
	mon[@ k_mon.experience] = mon_get_level_experience(mon, 1);
	repeat (1) mon_level_up(mon);
	mon[@ k_mon.hp] = mon_get_max_hp(mon);
	
	var dbMonster = global.dbMonsters[| 0];
	var dbAbilities = dbMonster[@ k_db_mon.abilities];
	var abilities = mon[@ k_mon.abilities];
		abilities[@ 0] = dbAbilities[? "Shank"];
		abilities[@ 1] = dbAbilities[? "Heal1"];
		abilities[@ 2] = dbAbilities[? "Capture"];
		abilities[@ 3] = dbAbilities[? "Flee"];
trainer[@ k_trainer.trainer] = mon;

var chimaera = mon_create();
	mon_set_seed(chimaera, 1, randint());
	chimaera[@ k_mon.experience] = mon_get_level_experience(chimaera, 3);
	repeat (3) mon_level_up(chimaera);
	chimaera[@ k_mon.hp] = mon_get_max_hp(chimaera);
	ds_list_add(chimaera[@ k_mon.unlocked_abilities], "Bite");
	ds_list_add(chimaera[@ k_mon.unlocked_abilities], "Rush");
	
	var dbMonster = global.dbMonsters[| 1];
	var dbAbilities = dbMonster[@ k_db_mon.abilities];
	var abilities = chimaera[@ k_mon.abilities];
		abilities[@ 0] = dbAbilities[? "Bite"];
		abilities[@ 1] = dbAbilities[? "Rush"];
ds_list_add(trainer[k_trainer.party], chimaera);
var chimaera = mon_create();
	mon_set_seed(chimaera, 2, randint());
	chimaera[@ k_mon.experience] = mon_get_level_experience(chimaera, 3);
	repeat (3) mon_level_up(chimaera);
	chimaera[@ k_mon.hp] = mon_get_max_hp(chimaera);
	ds_list_add(chimaera[@ k_mon.unlocked_abilities], "Scratch");
	ds_list_add(chimaera[@ k_mon.unlocked_abilities], "Protect");
	
	var dbMonster = global.dbMonsters[| 2];
	var dbAbilities = dbMonster[@ k_db_mon.abilities];
	var abilities = chimaera[@ k_mon.abilities];
		abilities[@ 0] = dbAbilities[? "Scratch"];
		abilities[@ 1] = dbAbilities[? "Protect"];
ds_list_add(trainer[k_trainer.party], chimaera);
var chimaera = mon_create();
	mon_set_seed(chimaera, 3, randint());
	chimaera[@ k_mon.experience] = mon_get_level_experience(chimaera, 3);
	repeat (3) mon_level_up(chimaera);
	chimaera[@ k_mon.hp] = mon_get_max_hp(chimaera);
	ds_list_add(chimaera[@ k_mon.unlocked_abilities], "Pinch");
	ds_list_add(chimaera[@ k_mon.unlocked_abilities], "Sting");
	
	var dbMonster = global.dbMonsters[| 3];
	var dbAbilities = dbMonster[@ k_db_mon.abilities];
	var abilities = chimaera[@ k_mon.abilities];
		abilities[@ 0] = dbAbilities[? "Pinch"];
		abilities[@ 1] = dbAbilities[? "Sting"];
ds_list_add(trainer[k_trainer.party], chimaera);

camera_set_target(self);
instance_create_depth(0, 0, -999, mHud);
