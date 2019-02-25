/// @func hud_draw_pause_menu();
/// Draws the Pause Menu

left = PADDING*2;
top = PADDING + 52;
right = GUI_WIDTH - PADDING*2;
bottom = GUI_HEIGHT - PADDING*2;

intensity = lerp(intensity, targetIntensity, 0.25);

// Obscure game world
draw_set_color(c_black);
draw_set_alpha(intensity);
draw_rectangle(0, 0, GUI_WIDTH, GUI_HEIGHT, false);

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
xx += 24;
headerWidths[1] = xx;

draw_sprite(sPauseMenuIcons, 1, xx, top);
xx += sPauseMenuIcons_Width + 4;
draw_text(xx, top + sPauseMenuIcons_Height / 2 + 2, "Party");
xx += string_width("Party");
xx += 24;
headerWidths[2] = xx;

draw_sprite(sPauseMenuIcons, 2, xx, top);
xx += sPauseMenuIcons_Width + 4;
draw_text(xx, top + sPauseMenuIcons_Height / 2 + 2, "Map");
xx += string_width("Map");
xx += 24;
headerWidths[3] = xx;

draw_sprite(sPauseMenuIcons, 3, xx, top);
xx += sPauseMenuIcons_Width + 8;
draw_text(xx, top + sPauseMenuIcons_Height / 2 + 2, "Options");
xx += string_width("Options");
xx += 24;
headerWidths[4] = xx;

draw_set_valign(fa_top);

// Draw item list header line
draw_set_color(c_white);
var itemListHeaderLineY = top + sPauseMenuIcons_Height + 4;
draw_line_width(left, itemListHeaderLineY, right, itemListHeaderLineY, 2);
draw_set_color(c_select);
draw_line_width(headerWidths[menuTab] - 8, itemListHeaderLineY, headerWidths[menuTab + 1] - 20, itemListHeaderLineY, 2);
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