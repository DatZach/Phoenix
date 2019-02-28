/// @desc Engage (Advantage)

var cpu = cpu_trainer_create();

var list = ds_list_create();
var num = instance_position_list(x, y, pMob, list, true);
for (var i = 0; i < num && i < FIELD_RANKS; ++i) {
	var inst = list[| i];
	if (distance_to_point(inst.x, inst.y) > ENGAGE_RADIUS)
		break;
	
	ds_list_add(cpu[k_trainer.party], inst.monster);
	instance_destroy(inst);
}

ds_list_destroy(list);
		
battle_create([oPlayer.trainer, cpu]);