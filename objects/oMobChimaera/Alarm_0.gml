/// @desc Select random target tree

if (grid == noone && global.collisionLayerId != noone) {
	// TODO Could improve tile collisions by doubling tile resolution
	var width = room_width / TILE_SIZE;
	var height = room_height / TILE_SIZE;
	
	grid = mp_grid_create(0, 0, width, height, TILE_SIZE, TILE_SIZE);
	for (var yy = 0; yy < height; ++yy) {
		for (var xx = 0; xx < width; ++xx) {
			var idx = tilemap_get_at_pixel(global.collisionLayerId, xx, yy);
			if (idx != 0)
				mp_grid_add_cell(grid, xx, yy);
		}
	}

	mp_grid_add_instances(grid, oTree, false);
}

var target = instance_nth_nearest(x, y, oTree, irandom(instance_number(oTree)));
if (target != noone) {
	path_clear_points(path);
	
	var escDir = 45;
	var escDist = 0;
	while(escDist < 4) {
		var xx = (x + lengthdir_x(escDist * TILE_SIZE, escDir)) div TILE_SIZE;
		var yy = (y + lengthdir_y(escDist * TILE_SIZE, escDir)) div TILE_SIZE;
		
		if (mp_grid_path(grid, path, x, y, target.x, target.y, true)) {
			pathIndex = 0;
			break;
		}
			
		if (escDir == 45)
			++escDist;
		
		escDir += 45;
		escDir %= 360;
	}
}

alarm[0] = irandom_range(TARGET_FPS*2, TARGET_FPS*10);
