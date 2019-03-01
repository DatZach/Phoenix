/// @desc 

if (y != yprevious) depth = -y;

// Resolve Input
if (pathIndex >= path_get_number(path)) {
	moveUp = false;
	moveDown = false;
	moveLeft = false;
	moveRight = false;
}
else {
	var dx = path_get_point_x(path, pathIndex) - x;
	var dy = path_get_point_y(path, pathIndex) - y;
	if (abs(dx) <= 24 && abs(dy) <= 24)
		++pathIndex;
	
	moveLeft = abs(dx) > 24 && dx < 0;
	moveRight = abs(dx) > 24 && dx > 0;
	moveUp = abs(dy) > 24 && dy < 0;
	moveDown = abs(dy) > 24 && dy > 0;
	//moveLeft = dx < 0;
	//moveRight = dx > 0;
	//moveUp = dy < 0;
	//moveDown = dy > 0;
}

//if (target == noone) {
//	moveUp = false;
//	moveDown = false;
//	moveLeft = false;
//	moveRight = false;
//}
//else {
//	var dx = target.x - x;
//	var dy = target.y - y;
//	moveLeft = abs(dx) > 24 && dx < 0;
//	moveRight = abs(dx) > 24 && dx > 0;
//	moveUp = abs(dy) > 24 && dy < 0;
//	moveDown = abs(dy) > 24 && dy > 0;
//}

event_inherited();
