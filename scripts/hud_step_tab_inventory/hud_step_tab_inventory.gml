/// @func hud_step_tab_inventory();
/// Handles update for Pause Menu Inventory Tab

if (input_check_pressed(global.k_down)) {
    // Inventory Down
    var top = PADDING;
    var bottom = GUI_HEIGHT - PADDING;
    var windowCount = floor(((bottom + 3 - PADDING - 20) - (top + 4 + 6)) / 20);
        
    ++itemIndex;
    if (itemIndex >= ds_list_size(oPlayer.inventory)) {
        itemIndex = 0;
        windowOffset = 0;
    }
        
    if (itemIndex - windowOffset > windowCount)
        ++windowOffset;
}
else if (input_check_pressed(global.k_up)) {
    // Inventory Up
    var top = PADDING;
    var bottom = GUI_HEIGHT - PADDING;
    var windowCount = floor(((bottom + 3 - PADDING - 20) - (top + 4 + 6)) / 20);
        
    --itemIndex;
    if (itemIndex < 0) {
        itemIndex = ds_list_size(oPlayer.inventory) - 1;
        windowOffset = ds_list_size(oPlayer.inventory) - windowCount - 1;
    }
        
    if (itemIndex - windowOffset < 0)
        --windowOffset;
}
else if (input_check_pressed(global.k_action) &&
		 (itemIndex > 0 || itemIndex < ds_list_size(oPlayer.inventory)))
{
    var item = oPlayer.inventory[| itemIndex];
    var itemMeta = global.dbItems[? item[@ k_item.key]];
    
    if (has_flag(itemMeta[@ k_db_item.type], ItemType.Battle))
        inventory_item_use(oPlayer.inventory, item);
    else if (has_flag(itemMeta[@ k_db_item.type], ItemType.Overworld))
        equip_set_item(item);
}

var len = max(ds_list_size(oPlayer.inventory) - 1, 0);
itemIndex = clamp(0, itemIndex, len);
windowOffset = clamp(0, windowOffset, len);
