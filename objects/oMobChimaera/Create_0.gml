/// @desc Initialize

TREE_RADIUS = 80;

// Configuration
event_inherited();
maxspd = 85;
accel = 85;
fric = 0.2;

monster = mon_create();
mon_initialize(monster, "Chimaera", 1);

// Variables
target = noone;

alarm[0] = 1;
