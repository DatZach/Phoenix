/// @func battle_is_trainer_battle()
/// Returns if current battle is a Trainer battler
/// @context mBattle
/// @returns bool

var trainer = trainers[@ FIELD_FOE];
return trainer[@ k_trainer.trainer] != noone;
