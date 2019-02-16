/// @desc Initialize

// Configuration
event_inherited();
maxspd = 85;
accel = 85;
fric = 0.2;

image_speed = 0;
image_index = 1;

player = player_trainer_create();
var trainer = mon_create();
	mon_set_seed(trainer, 0, randint());
	trainer[@ k_mon.experience] = mon_get_level_experience(trainer, 1);
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

camera_set_target(self);
