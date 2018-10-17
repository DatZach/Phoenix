/// @desc Idle

alarm[1] = 50 + irandom(25);

var r = irandom(100);

// Non-Agro
if (r < 60) {
	moveLeft = false;
	moveRight = false;
	moveUp = false;
	moveDown = false;
	alarm[1] = 2*TARGET_FPS+irandom(3*TARGET_FPS);
}
else {
	moveLeft = r > 80;
	moveUp = irandom(100) > 50;
	moveRight = !moveLeft;
	moveDown = !moveUp;
}
