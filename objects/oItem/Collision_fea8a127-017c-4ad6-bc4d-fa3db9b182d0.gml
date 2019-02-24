/// @description  Pickup item

if (!canBeAquired)
    exit;

//toast_item(item);
inventory_add_item(oPlayer.inventory, itemKey);
instance_destroy();
