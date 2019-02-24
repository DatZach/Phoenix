/// @func inventory_item_create(itemKey)
/// Creates a new InventoryItem of specified DB Key
/// @param itemKey string Item DB Key
/// @returns Item

enum k_item {
	key,
	stock,
	_size
}

var itemKey = argument0;

if (!ds_map_exists(global.dbItems, itemKey))
	error(true, "Unknown Item Key: ", itemKey);

var item = array_create(k_item._size);
item[@ k_item.key] = itemKey;
item[@ k_item.stock] = 1;

return item;
