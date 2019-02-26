/// @func hud_draw_toasts()
/// Draw toasts

var TOAST_HEIGHT = 19;
var toastY = PADDING;
var toastX = GUI_WIDTH - PADDING;

var count = ds_list_size(toasts);
for(var i = 0; i < count; ++i) {
    var toast = toasts[| i];
    var frames = toast[@ k_toast.frames];
    var itemMeta = global.dbItems[? toast[@ k_toast.item_key]];
    var name = itemMeta[@ k_db_item.key]; // TODO Localize
    
    draw_set_font(fPauseMenuContent);
    var width = floor(max(125, string_width(name) + 32));
    var rectWidth = max(0, width - 49 * 2);
    
    var alphaMul = min(8, frames) / 8;
    var slideOffset = ((8 - min(8, frames)) / 8) * width;
    var tX = floor(toastX - width + slideOffset);
    
    // Draw toast backdrop
    draw_set_alpha(0.55 * alphaMul);
    draw_set_color(c_black);
    draw_sprite(sToast, 0, tX, toastY);
    draw_rectangle(tX + 49, toastY, tX + 49 + rectWidth - 1, toastY + 19 - 1, false);
    draw_sprite(sToast, 1, tX + 49 + rectWidth, toastY);
    draw_set_alpha(1 * alphaMul);
    
    // Draw name
    draw_set_color(c_white);
    draw_set_valign(fa_middle);
    draw_text_outline(tX + 8, toastY + TOAST_HEIGHT / 2, name, 1, c_black, 4);
    draw_set_valign(fa_top);
    
    // Draw icon
    draw_sprite(sIconItem, itemMeta[@ k_db_item.img_index], tX + width - 8, toastY + TOAST_HEIGHT / 2 - 1);
    
    draw_set_alpha(1);
    
    toastY += TOAST_HEIGHT + 6;
}
