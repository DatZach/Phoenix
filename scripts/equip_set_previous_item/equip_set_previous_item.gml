/// @func equip_pop()
/// Pops an item off of the equip stack onto the equipped item

do {
    oPlayer.equippedItem = ds_stack_empty(oPlayer.equipStack) ? noone : ds_stack_pop(oPlayer.equipStack);
} until(oPlayer.equippedItem == noone || inventory_item_exists(oPlayer.inventory, oPlayer.equippedItem));
