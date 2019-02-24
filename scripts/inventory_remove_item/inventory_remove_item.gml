/// @func inventory_remove_item(inventory, item)
/// Removes a single stock from the inventory
/// @param inventory Inventory
/// @param item Item
/// @returns bool true if removed, false if nothing to remove

var inventory = argument0;
var item = argument1;

var itemMeta = global.dbItems[? item[@ k_item.key]];
    
var stock = --item[@ k_item.stock];
if (stock <= 0) {
    ds_list_delete_value(inventory, item);
    return false;
}
    
return true;