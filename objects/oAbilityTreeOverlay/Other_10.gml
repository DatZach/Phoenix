/// @desc Initialize

var dbMon = global.dbMonsters[| monster[@ k_mon.class]];
var abilities = dbMon[@ k_db_mon.abilities];

// Nodes
var key = ds_map_find_first(abilities);
for (var i = 0, isize = ds_map_size(abilities); i < isize; ++i) {
	var ability = abilities[? key];
	
	var xx = PADDING + (PADDING*6+ABILITY_WIDTH)*i;
	var yy = PADDING + (PADDING*1+ABILITY_HEIGHT)*i;
	
	var node = [ability, xx, yy];
	ds_list_add(nodes, node);
	
	key = ds_map_find_next(abilities, key);
}

// Connections
var key = ds_map_find_first(abilities);
for (var i = 1, isize = ds_map_size(abilities); i < isize; ++i) {
	var ability = abilities[? key];
	var dependencies = ability[@ Ability.Dependencies];
	if (dependencies == noone)
		continue;
	
	var nextIdx;
	for (var j = 0, jsize = ds_list_size(nodes); j < jsize; ++j) {
		var node = nodes[| j];
		if (node[@ 0] == ability) {
			nextIdx = j;
			break;
		}
	}
	
	for (var k = 0, ksize = ds_list_size(dependencies); k < ksize; ++k) {
		var dependency = dependencies[| k];
		
		var prevIdx;
		for (var j = 0, jsize = ds_list_size(nodes); j < jsize; ++j) {
			var node = nodes[| j];
			var nodeAbility = node[@ 0];
			if (nodeAbility[@ Ability.Key] == dependency) {
				prevIdx = j;
				break;
			}
		}
	
		var connection = [prevIdx,nextIdx];
		ds_list_add(connections, connection);
	}
	
	key = ds_map_find_next(abilities, key);
}
