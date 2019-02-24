/// @func hud_draw_tab_inventory();
/// Draws inventory tab

var itemMenuX = left + 5;
var itemMenuY = top + sPauseMenuIcons_Height + 4 + 6;
var itemMenuHeight = bottom + 3 - PADDING - 20;
var inventorySize = ds_list_size(oPlayer.inventory); // HACK Exposes underlying implementation
        
draw_set_font(fPauseMenuContent);
draw_set_valign(fa_middle);
        
// Highlight selected item
if (inventorySize > 0) {
    var selectedItemIndexY = itemMenuY - 1 + (itemIndex - windowOffset) * 20;
    draw_set_color(c_select);
    draw_set_alpha(intensity / targetIntensity * 0.5);
    draw_rectangle(left, selectedItemIndexY, headerWidths[3], selectedItemIndexY + 17, false);
    draw_set_alpha(intensity * 2);
    draw_rectangle(left, selectedItemIndexY, left + 2, selectedItemIndexY + 17, false);
}
        
draw_set_color(c_white);
        
// Draw items in inventory
var i = windowOffset;
for(; i < inventorySize && itemMenuY < itemMenuHeight; ++i) {
    var item = oPlayer.inventory[| i];
    var itemMeta = global.dbItems[? item[@ k_item.key]];
            
    draw_sprite(sIconItem, itemMeta[@ k_db_item.img_index], itemMenuX + 8, itemMenuY + 8);
    draw_text(itemMenuX + 16 + 5, itemMenuY + 9, itemMeta[@ k_db_item.key]); // TODO Localize
            
    var txx = headerWidths[3] - 2;
            
    draw_set_halign(fa_right);
            
    if (i == itemIndex) {
        // ITEM SELECTED
                
        if (has_flag(itemMeta[@ k_db_item.type], ItemType.Overworld)) {
            var displayText = concat(input_get_name(global.k_action), "  |  Equip >");
            draw_text(txx, itemMenuY + 9, displayText);
                    
            txx -= string_width(displayText) + 16;
        }
        else if (has_flag(itemMeta[@ k_db_item.type], ItemType.Battle)) {
            var displayText = concat(input_get_name(global.k_action), "  |  Use >");
            draw_text(txx, itemMenuY + 9, displayText);
                    
            txx -= string_width(displayText) + 16;
        }
    }
            
	var maxStock = itemMeta[@ k_db_item.max_stock];
    if (maxStock > 1)
        draw_text(txx, itemMenuY + 9, concat(item[@ k_item.stock], " / ", maxStock, " Stock"));
            
    draw_set_halign(fa_left);
            
    itemMenuY += 20;
}
        
if (i < inventorySize) {
    var displayText = concat(inventorySize - i, " More Items");
    var itemMenuCenterX = (headerWidths[3] - itemMenuX) / 2 + itemMenuX;
    var messageWidth = string_width(displayText);
            
    draw_set_halign(fa_center);
    draw_text(itemMenuCenterX, itemMenuY + 9, displayText);
    draw_set_halign(fa_left);
            
    draw_line_width(itemMenuX, itemMenuY + 8, itemMenuCenterX - messageWidth / 2 - 8, itemMenuY + 8, 2);
    draw_line_width(itemMenuCenterX + messageWidth / 2 + 8, itemMenuY + 8, headerWidths[3], itemMenuY + 8, 2);
}
        
draw_set_valign(fa_top);
        
// Draw item preview
if (inventorySize != 0 && itemIndex < inventorySize) {
    var left3 = headerWidths[3] + PADDING;
    var ipCenterX = left3 + (right - left3) / 2 - 12;
    var ipCenterY = top + 24 + PADDING + 64;
            
    var item = oPlayer.inventory[| itemIndex]; // HACK Exposes uderlying implementation
    var itemMeta = global.dbItems[? item[@ k_item.key]];
            
    draw_sprite(sPortraitItem, itemMeta[@ k_db_item.img_index], ipCenterX, ipCenterY);
            
    draw_set_halign(fa_center);
    draw_text_width_outline(
		ipCenterX, ipCenterY + PADDING + 64,
		concat(itemMeta[@ k_item.key], "\n\n", "DESCRIPTION"),
		1, c_black, 4,
		GUI_WIDTH - PADDING - left3
	);
    draw_set_halign(fa_left);
}
else {
    var itemMenuCenterX = (headerWidths[3] - itemMenuX) / 2 + itemMenuX;
    var itemMenuCenterY = (itemMenuHeight - itemMenuY) / 2 + itemMenuY;
            
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_outline(itemMenuCenterX, itemMenuCenterY, "*Cricket Noises*", 2, c_black, 4);
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
}