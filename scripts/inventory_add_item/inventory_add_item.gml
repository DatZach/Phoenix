/// @func inventory_add_item(inventory, itemKey)
/// Adds an item to the inventory
/// @param inventory Inventory
/// @param item string
/// @returns Item Returns Item or noone if none could be added

var inventory = argument0;
var itemKey = argument1;
    
// Increase stock if item is stackable
var itemMeta = global.dbItems[? itemKey];
if (itemMeta[@ k_db_item.max_stock] > 1) {
    var item = inventory_find_item_via_key(inventory, itemKey);
    if (item != noone) {
        if (itemMeta[@ k_db_item.max_stock] > 0 && item[@ k_item.stock] >= itemMeta[@ k_db_item.max_stock])
            return noone;
            
        ++item[@ k_item.stock];
        return item;
    }
}
   
// Otherwise, just create a new item
var item = inventory_item_create(itemKey);
ds_list_add(inventory, item);
    
return item;
