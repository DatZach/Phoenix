/// @desc Initialize

// Configuration
event_inherited();
maxspd = 85;
accel = 85;
fric = 0.2;

image_speed = 0;
image_index = 1;

// Variables
inventory = inventory_create();
equippedItem = noone;
equipStack = ds_stack_create();
trainer = player_trainer_create();
trainer[@ k_trainer.trainer] = mon_create();
activeMonster = trainer[@ k_trainer.trainer];

mon_initialize(trainer[@ k_trainer.trainer], "Trainer", 1);

instance_create_layer(x + irandom_range(32, 64), y + irandom_range(32, 64), layer, oPartyMember);

camera_set_target(self);
