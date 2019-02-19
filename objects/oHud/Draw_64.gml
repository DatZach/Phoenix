PADDING = floor(GUI_WIDTH * 0.01);
FIELD_BOTTOM = floor(GUI_HEIGHT * 0.66);
LINE_HEIGHT = string_height("W");
PORTRAIT_SIZE = 32;
HEALTH_WIDTH = 320;

var xx = PADDING;
var yy = PADDING;

// Portrait
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(xx, yy, xx + PORTRAIT_SIZE, yy + PORTRAIT_SIZE, false);
draw_set_alpha(1);
draw_sprite_ext(
	sMonsterPortrait, selectedMonster[@ k_mon.class],
	xx + PORTRAIT_SIZE / 2, yy + PORTRAIT_SIZE - 1,
	(PORTRAIT_SIZE - 2) / sprite_get_width(sMonsterPortrait),
	(PORTRAIT_SIZE - 2) / sprite_get_height(sMonsterPortrait),
	0, c_white, 1
);

// Name / Level
xx = xx + PORTRAIT_SIZE + PADDING;
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_text_outline(
	xx, yy,
	concat(mon_get_name(selectedMonster), " Lv. ", selectedMonster[@ k_mon.level]),
	1, c_black, 4
);

// Health
yy = yy + LINE_HEIGHT + 4;
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(xx, yy, HEALTH_WIDTH, PORTRAIT_SIZE + 4, false);
draw_set_alpha(1);
draw_set_color(c_red);
draw_rectangle(
	xx + 1, yy + 1,
	xx + 1 + (HEALTH_WIDTH - 2 - xx) * (selectedMonster[@ k_mon.hp] / mon_get_stat(selectedMonster, k_stats.hp)), PORTRAIT_SIZE + 4 - 1,
	false
);

// TODO Note other party members and their status
// TODO Note Overworld Action