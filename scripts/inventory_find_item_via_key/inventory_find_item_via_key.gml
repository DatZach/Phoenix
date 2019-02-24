/// @func inventory_item_find_via_key(inventory, itemKey)
/// Returns the first occurrence of an Item in the specified inventory given the itemKey
/// @param inventory Inventory
/// @param itemKey string Item Key
/// @returns Item | noone

var inventory = argument0;
var itemKey = argument1;

var count = ds_list_size(inventory);
for(var i = 0; i < count; ++i) {
    var item = inventory[| i];
    if (item[@ k_item.key] == itemKey)
        return item;
}

return noone;
