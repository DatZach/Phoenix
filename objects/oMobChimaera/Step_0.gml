/// @desc 

// Resolve Input
// TODO Resolve collions in path
if (target == noone) {
	moveUp = false;
	moveDown = false;
	moveLeft = false;
	moveRight = false;
}
else {
	var dx = target.x - x;
	var dy = target.y - y;
	moveLeft = abs(dx) > 24 && dx < 0;
	moveRight = abs(dx) > 24 && dx > 0;
	moveUp = abs(dy) > 24 && dy < 0;
	moveDown = abs(dy) > 24 && dy > 0;
}

event_inherited();
