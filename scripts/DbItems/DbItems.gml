/// @function DbItems()
/// Initializes Items Database

enum k_db_item {
	key,				// string
	image_index,		// real
	type,				// ItemType
	width,				// real
	height,				// real
	max_stock,			// real
	_size
}

enum ItemType {
	None = 0,
	Overworld = 1,		// Usable in Overworld (Equippable)
	Battle = 2			// Usable in Battle
}

// Parse JSON Database
var contents = "";
var file = file_text_open_read(working_directory + @"\Databases\Items.json");
while (!file_text_eof(file)) {
	contents += file_text_read_string(file);
	file_text_readln(file);
}

file_text_close(file);

var json = json_decode(contents);

// Load into Memory
global.dbItems = ds_map_create();
for (var key = ds_map_find_first(json); !is_undefined(key); key = ds_map_find_next(json, key)) {
	var jsonItem = json[? key];
	
	var dbItem = array_create(k_db_item._size);
		dbItem[@ k_db_item.image_index] = jsonItem[? "imageIndex"];
		dbItem[@ k_db_item.type] = ItemType.None;
		var itemTypes = string_split(jsonItem[? "type"], "|");
		for (var i = 0, ilen = array_length_1d(itemTypes); i < ilen; ++i) {
			switch(itemTypes[i]) {
				case "Overworld": dbItem[@ k_db_item.type] |= ItemType.Overworld; break;
				case "Battle": dbItem[@ k_db_item.type] |= ItemType.Battle; break;
				default:
					error(true, "Unknown DB Item Type: ", itemTypes[i]);
			}
		}
		dbItem[@ k_db_item.width] = jsonItem[? "width"];
		dbItem[@ k_db_item.height] = jsonItem[? "height"];
		dbItem[@ k_db_item.max_stock] = jsonItem[? "maxStock"];
	ds_map_add(global.dbItems, key, dbItem);
}

trace("Inventory DB Loaded; ", ds_map_size(global.dbItems), " Items");
