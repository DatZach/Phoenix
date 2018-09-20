draw_set_font(fBattleHudContent);

PADDING = floor(GUI_WIDTH * 0.01);
LINE_HEIGHT = string_height("W");

draw_set_color(c_red);
draw_rectangle(0, 0, GUI_WIDTH, GUI_HEIGHT, false);
