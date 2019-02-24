/// @func equip_use()
/// Uses equipped item

var item = equip_get_item();
if (item == noone)
	return;

var stockExists = inventory_item_use(oPlayer.inventory, item);
if (!stockExists)
    equip_set_previous_item();
