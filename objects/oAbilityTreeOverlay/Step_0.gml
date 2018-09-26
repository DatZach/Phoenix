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
	var ability = selectedNode[@ AbilityNode.Ability];
	var abilityKey = ability[@ Ability.Key];
	var unlockedAbilities = monster[@ k_mon.unlocked_abilities];
	if (ds_list_find_index(unlockedAbilities, abilityKey) != -1 ||
		!ability_tree_is_ability_unlockable(monster, ability))
		exit;
	
	monster[@ k_mon.ap] -= 1;
	ds_list_add(unlockedAbilities, abilityKey);
	
	var abilities = monster[@ k_mon.abilities];
	for (var i = 0; i < 4; ++i) {
		if (abilities[@ i] != noone)
			continue;
			
		abilities[@ i] = ability;
		break;
	}
	
	if (monster[@ k_mon.ap] <= 0) {
		instance_destroy();
		io_clear();
	}
}
else if (input_check_pressed(global.k_back)) {
	instance_destroy();
	io_clear();
}
