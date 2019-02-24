/// @func equip_set_item(item)
/// Sets the currently equipped item

var item = argument0;

// Prevent us from using a BUNCH of memory for no reason
if (ds_stack_size(oPlayer.equipStack) > 16) {
    ds_stack_clear(oPlayer.equipStack)
    ds_stack_push(oPlayer.equipStack, noone);
}
            
if (ds_stack_top(oPlayer.equipStack) != oPlayer.equippedItem)
    ds_stack_push(oPlayer.equipStack, oPlayer.equippedItem);
                
oPlayer.equippedItem = item;
            
trace("Equipped item ", oPlayer.equippedItem[@ k_item.key], "; stack = ", ds_stack_size(oPlayer.equipStack));
