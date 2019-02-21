moveLeft = input_check(global.k_left) && !input_check(global.k_right);
moveRight = input_check(global.k_right) && !input_check(global.k_left);
moveUp = input_check(global.k_up) && !input_check(global.k_down);
moveDown = input_check(global.k_down) && !input_check(global.k_up);

event_inherited();

if (moveUp)
	sprite_index = sSquirrelWalkUp;
else if (moveDown)
	sprite_index = sSquirrelWalkDown;
else if (moveLeft)
	sprite_index = sSquirrelWalkLeft;
else if (moveRight)
	sprite_index = sSquirrelWalkRight;

image_speed = abs(spd) / maxspd;
if (image_speed == 0)
	image_index = 1;
