/// @func inventory_item_exists(inventory, item)
/// Returns if the specified item exists in the inventory
/// @param inventory Inventory
/// @param item Item
/// @returns bool

var inventory = argument0;
var item = argument1;

return ds_list_find_index(inventory, item) != -1;
