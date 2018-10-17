/// @desc Overworld Encounter

var cpu = cpu_trainer_create();
ds_list_add(cpu[k_trainer.party], other.monster);

var battle = battle_create([player, cpu]);

instance_destroy(other);
