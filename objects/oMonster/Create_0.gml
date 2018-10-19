/// @desc Initialize

event_inherited();

// Configuration
maxspd = 180/3;
accel = 180/3;
monster = noone;
spawner = noone;
despawnTimer = -1;

alarm[1] = 50 + irandom(20);
alarm[2] = (35 + irandom(60)) * TARGET_FPS;
