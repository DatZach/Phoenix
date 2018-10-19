/// @desc Physics, AI, Despawn
if (in_battle()) exit;

// Tick Despawn
if (despawnTimer > -1 && despawnTimer-- == 0)
	instance_destroy();

// Despawn if startled
if (despawnTimer == -1) {
	if (distance_to_object(oPlayer) < 60)
		despawnTimer = 3*TARGET_FPS;
}
