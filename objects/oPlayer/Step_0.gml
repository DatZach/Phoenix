moveLeft = input_check(global.k_left) && !input_check(global.k_right);
moveRight = input_check(global.k_right) && !input_check(global.k_left);
moveUp = input_check(global.k_up) && !input_check(global.k_down);
moveDown = input_check(global.k_down) && !input_check(global.k_up);

if (input_check_pressed(global.k_action))
	instance_create_layer(x, y, layer, oBou);

event_inherited();

if (moveUp)
	sprite_index = sPlayerWalkUp;
else if (moveDown)
	sprite_index = sPlayerWalkDown;
else if (moveLeft)
	sprite_index = sPlayerWalkLeft;
else if (moveRight)
	sprite_index = sPlayerWalkRight;

image_speed = abs(spd) / maxspd;
if (image_speed == 0)
	image_index = 1;
