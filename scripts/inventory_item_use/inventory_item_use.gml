/// @func inventory_item_use(inventory, item)
/// Uses an inventory item
/// @param inventory Inventory
/// @param item Item
/// @returns bool false if item stock is depleted, true otherwise

var inventory = argument0;
var item = argument1;

var itemMeta = global.dbItems[? item[@ k_item.key]];
//return script_execute(itemMeta[@ k_db_item.callback]);

switch (itemMeta[@ k_db_item.key]) {
	case "Acorn":
		trace("Used acorn");
		break;
}

return inventory_remove_item(inventory, item);