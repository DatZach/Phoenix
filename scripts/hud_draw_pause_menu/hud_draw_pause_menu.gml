/// @func hud_draw_pause_menu();
/// Draws the Pause Menu

left = PADDING;
top = PADDING;
right = GUI_WIDTH - PADDING;
bottom = GUI_HEIGHT - PADDING;

intensity = lerp(intensity, targetIntensity, 0.25);

// Obscure game world
draw_set_color(c_black);
draw_set_alpha(intensity);
draw_rectangle(0, 0, GUI_WIDTH, GUI_HEIGHT, false);

//FxInitializeDesaturatedBlur();

draw_set_alpha(intensity * 2);

// Draw item list header
var xx = left + PADDING;
//var headerWidths;
headerWidths[4] = 0;
headerWidths[0] = xx;

draw_set_color(c_white);
draw_set_font(fPauseMenuHeader);
draw_set_valign(fa_middle);

draw_sprite(sPauseMenuIcons, 0, xx, top);
xx += sPauseMenuIcons_Width + 4;
draw_text(xx, top + sPauseMenuIcons_Height / 2 + 2, "Inventory");
xx += string_width("Inventory");
xx += 8;
headerWidths[1] = xx;

draw_sprite(sPauseMenuIcons, 1, xx, top);
xx += sPauseMenuIcons_Width + 4;
draw_text_outline(xx, top + sPauseMenuIcons_Height / 2 + 2, "Party", 2, c_black, 4);
xx += string_width("Party");
xx += 8;
headerWidths[2] = xx;

draw_sprite(sPauseMenuIcons, 2, xx, top);
xx += sPauseMenuIcons_Width + 4;
draw_text_outline(xx, top + sPauseMenuIcons_Height / 2 + 2, "Map", 2, c_black, 4);
xx += string_width("Map");
xx += 8;
headerWidths[3] = xx;

draw_sprite(sPauseMenuIcons, 3, xx, top);
xx += sPauseMenuIcons_Width + 8;
draw_text_outline(xx, top + sPauseMenuIcons_Height / 2 + 2, "Options", 2, c_black, 4);
xx += string_width("Options");
xx += 8;
headerWidths[4] = xx;

draw_set_valign(fa_top);

// Draw item list header line
draw_set_color(c_white);
var itemListHeaderLineY = top + sPauseMenuIcons_Height + 4;
draw_line_width(left, itemListHeaderLineY, right, itemListHeaderLineY, 2);
draw_set_color(c_select);
draw_line_width(headerWidths[menuTab], itemListHeaderLineY, headerWidths[menuTab + 1] - 8, itemListHeaderLineY, 2);
draw_set_color(c_white);

switch(menuTab) {
    case PauseMenuTab.Inventory:
        hud_draw_tab_inventory();
        break;
    
    case PauseMenuTab.Party:
        break;
        
    case PauseMenuTab.Map:
        break;
}

draw_set_alpha(1);