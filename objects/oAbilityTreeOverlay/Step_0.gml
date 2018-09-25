/// @desc Input

if (instance_find(object_index, 0) != id) exit;

if (input_check_pressed(global.k_left)) {
	var candidate = ability_tree_nearest_node(selectedNode, AbilityNode.X, -1);
	if (candidate != noone)
		selectedNode = candidate;
}
else if (input_check_pressed(global.k_right)) {
	var candidate = ability_tree_nearest_node(selectedNode, AbilityNode.X, 1);
	if (candidate != noone)
		selectedNode = candidate;
}
else if (input_check_pressed(global.k_up)) {
	var candidate = ability_tree_nearest_node(selectedNode, AbilityNode.Y, -1);
	if (candidate != noone)
		selectedNode = candidate;
}
else if (input_check_pressed(global.k_down)) {
	var candidate = ability_tree_nearest_node(selectedNode, AbilityNode.Y, 1);
	if (candidate != noone)
		selectedNode = candidate;
}
else if (input_check_pressed(global.k_action)) {
	
}
else if (input_check_pressed(global.k_back)) {
	instance_destroy();
	io_clear();
}
