/// @desc Input

if (instance_find(object_index, 0) != id) exit;

if (keyboard_check_pressed(global.k_action)) {
	
}
else if (keyboard_check_pressed(global.k_back)) {
	instance_destroy();
	io_clear();
}
