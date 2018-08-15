/// @desc console_draw(console);
/// Draws a debug console
/// @param console Console

var HISTORY_BACKLOG = 8;
    
var console = argument0;

draw_set_font(fDebugConsole);

var unseenHistory = console_get_unseen_history_count(console);
if (unseenHistory > 0) {
    var OFFSET = 12;
    
    var badgeHeight = string_height("M");
	var badgeWidth = max(badgeHeight + 2, string_width(string(unseenHistory)));
	
	var xx = display_get_gui_width() - OFFSET - badgeWidth - 128;
	var yy = OFFSET;
    
	draw_set_alpha(0.8);
    draw_set_color(c_black);
    draw_roundrect_ext(
        xx, yy,
        xx + badgeWidth + 128,
        yy + badgeHeight + 4,
        12, 12,
        false
    );
    
    draw_set_color(c_white);
    draw_roundrect_ext(
        xx + 2,
        yy + 2,
        xx + 2 + badgeWidth,
        yy + badgeHeight + 2,
        12, 12,
        false
    );
    
    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text(
        floor(xx + 3 + badgeWidth / 2),
        floor(yy + 3 + badgeHeight / 2),
        string(unseenHistory)
    );
    draw_set_valign(fa_top);
    draw_set_halign(fa_left);
    
    draw_set_color(c_white);
    draw_set_valign(fa_middle);
    draw_text(
        floor(xx + 4 + badgeWidth + 6),
        floor(yy + badgeHeight / 2 + 3),
        "Unread Messages"
    );
    draw_set_valign(fa_top);
	draw_set_alpha(1);
    
    return 0;
}

if (!console_is_active(console))
    return 0;

var historyBottom = string_height("W") * HISTORY_BACKLOG + 8 + 8;
var consoleBottom = historyBottom + 8 + 12;

// Background
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(0, 0, window_get_width(), consoleBottom, false);
draw_set_color(c_white);
draw_set_alpha(1);

// Command line
var cursor = get_timer() / 1000 % 1000 > 500 ? "|" : "";
draw_text(8, floor(historyBottom - string_height("W")), "\n# " + keyboard_string + cursor);

// History
var history = console[? "history"];
for(var i = 0, j = ds_list_size(history); i < j && i < HISTORY_BACKLOG; ++i) {
    var yy = historyBottom - i * string_height("W") - 8 - string_height("W");
    draw_text(8, floor(yy), history[| j - i - 1]);
}

return 1;
