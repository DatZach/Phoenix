/// @desc Initialize

var dbMon = global.dbMonsters[| monster[@ k_mon.class]];
var abilities = dbMon[@ k_db_mon.abilities];

var key = ds_map_find_first(abilities);
for (var i = 0, isize = ds_map_size(abilities); i < isize; ++i) {
	var ability = abilities[? key];
	
	var xx = PADDING + (PADDING+ABILITY_WIDTH)*i;
	var yy = PADDING + (PADDING+ABILITY_HEIGHT)*i;
	
	var node = [ability, xx, yy];
	ds_list_add(nodes, node);
	
	key = ds_map_find_next(abilities, key);
}

var key = ds_map_find_first(abilities);
for (var i = 0, isize = ds_map_size(abilities); i < isize; ++i) {
	var ability = abilities[? key];
	var dependencies = ability[@ Ability.Dependencies];
	
	key = ds_map_find_next(abilities, key);
}