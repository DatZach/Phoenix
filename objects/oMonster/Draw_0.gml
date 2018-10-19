if (despawnTimer > -1 && despawnTimer % max(floor(despawnTimer / 10), 1) == 0)
	exit;

draw_self();