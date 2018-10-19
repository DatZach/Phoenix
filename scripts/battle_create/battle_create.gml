/// @func battle_create();
/// Creates a battle
/// @return Battle

var inst = instance_create_layer(0, 0, LAYER_INSTANCES_FOREGROUND, mBattle);
inst.trainers = argument0;

return inst;