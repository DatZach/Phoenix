/// @desc Initialize

var dbMon = global.dbMonsters[| monster[@ k_mon.class]];
var abilities = dbMon[@ k_db_mon.abilities];

if (monster[@ k_mon.ap] <= 0) {
	instance_destroy();
	io_clear();
}

var columns = array_create(12, 0);

// Nodes
var key = ds_map_find_first(abilities);
for (var i = 0, isize = ds_map_size(abilities); i < isize; ++i) {
	var ability = abilities[? key];
	
	var xx = 0;
	var yy = 0;
	
	var depStack = ds_stack_create();
	
	var deps = ability[@ Ability.Dependencies];
	if (ds_exists(deps, ds_type_list)) {
		for (var k = 0, ksize = ds_list_size(deps); k < ksize; ++k)
			ds_stack_push(depStack, deps[| k]);
		
		xx += 1;
	}
	
	while(!ds_stack_empty(depStack)) {
		var dkey = ds_stack_pop(depStack);
		var dependency = abilities[? dkey];
		
		deps = dependency[@ Ability.Dependencies];
		if (ds_exists(deps, ds_type_list)) {
			for (var k = 0, ksize = ds_list_size(deps); k < ksize; ++k)
				ds_stack_push(depStack, deps[| k]);
				
			xx += ksize;
			yy += 0.5;
		}
	}
	
	yy = (yy + columns[xx]) * (PADDING*2 + ABILITY_HEIGHT) + PADDING;
	++columns[xx];
	xx = xx * (PADDING*2 + ABILITY_WIDTH) + PADDING;
	
	var node = [ability, xx, yy];
	ds_list_add(nodes, node);
	
	key = ds_map_find_next(abilities, key);
}

// Connections
var key = ds_map_find_first(abilities);
for (var i = 0, isize = ds_map_size(abilities); i < isize; ++i) {
	var ability = abilities[? key];
	key = ds_map_find_next(abilities, key);
	
	var dependencies = ability[@ Ability.Dependencies];
	if (dependencies == noone)
		continue;
	
	var nextIdx;
	for (var j = 0, jsize = ds_list_size(nodes); j < jsize; ++j) {
		var node = nodes[| j];
		if (node[@ AbilityNode.Ability] == ability) {
			nextIdx = j;
			break;
		}
	}
	
	for (var k = 0, ksize = ds_list_size(dependencies); k < ksize; ++k) {
		var dependency = abilities[? dependencies[| k]];
		
		var prevIdx;
		for (var j = 0, jsize = ds_list_size(nodes); j < jsize; ++j) {
			var node = nodes[| j];
			if (node[@ AbilityNode.Ability] == dependency) {
				prevIdx = j;
				break;
			}
		}
	
		var connection = [prevIdx,nextIdx];
		ds_list_add(connections, connection);
	}
}

selectedNode = nodes[| 0];
