if (instance_find(object_index, 0) != id) exit;

draw_set_font(fBattleHudContent);

PADDING = floor(GUI_WIDTH * 0.01);
LINE_HEIGHT = string_height("W");
height = floor(GUI_HEIGHT * 0.68);

var left = PADDING;
var top = floor(GUI_HEIGHT/2 - height/2);
var right = GUI_WIDTH - PADDING;
var bottom = floor(GUI_HEIGHT/2 + height/2);

// Light Box
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(0, 0, GUI_WIDTH, GUI_HEIGHT, false);
draw_set_alpha(1);

// Panel
draw_set_color(c_black);
draw_set_alpha(0.85);
draw_rectangle(left, top, right, bottom, false);
draw_set_color(c_white);
draw_set_alpha(1);
draw_rectangle(left, top, right, bottom, true);
draw_line(left, top + 64 + PADDING*2, right, top + 64 + PADDING*2);
draw_line(left, bottom - LINE_HEIGHT - PADDING*2, right, bottom - LINE_HEIGHT - PADDING*2);

// Heading
draw_sprite_ext(
	sMonsterPortrait, monster[@ k_mon.class],
	left + PADDING + 64/2, top + 64 + PADDING,
	64 / sprite_get_width(sMonsterPortrait), 64 / sprite_get_height(sMonsterPortrait),
	0, c_white, 1
);

draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_text_outline(
	left + 64 + PADDING*2, top + 64/2 + PADDING,
	concat(mon_get_name(monster), "\nLevel ", monster[@ k_mon.level]),
	1, c_black, 4
);
draw_set_valign(fa_top);

// Footer
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
draw_text_outline(
	right - PADDING, bottom - LINE_HEIGHT/2 - PADDING,
	concat(monster[@ k_mon.ap], " AP"),
	1, c_black, 4
);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
