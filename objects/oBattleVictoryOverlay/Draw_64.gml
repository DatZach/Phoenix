if (instance_exists(oAbilityTreeOverlay)) exit;

draw_set_font(fBattleHudContent);

PADDING = floor(GUI_WIDTH * 0.01);
FIELD_BOTTOM = floor(GUI_HEIGHT * 0.66);
LINE_HEIGHT = string_height("W");
COLUMN_WIDTH = floor(sprite_get_width(sMonsterPortrait) * 1.5);
PORTRAIT_HEIGHT = sprite_get_height(sMonsterPortrait);

draw_set_alpha(0.5);
draw_set_color(c_gray);
draw_rectangle(0, 0, GUI_WIDTH, GUI_HEIGHT, false);
draw_set_alpha(1);

// Victory Banner
draw_set_font(fBattleIndicator);
var width = string_width("Victory!");
var xx = floor(GUI_WIDTH / 2);
var yy = floor(PADDING + LINE_HEIGHT / 2);
draw_set_color(c_white);
draw_set_valign(fa_center);
draw_set_halign(fa_middle);
draw_text_outline(xx, yy, "Victory!", 2, c_black, 4);
draw_set_halign(fa_top);
draw_set_valign(fa_left);

draw_set_color(c_black);
draw_line_width(xx - width/2 - 8, yy - 1, xx - 128, yy - 1, 3);
draw_line_width(xx + width/2 + 8, yy - 1, xx + 128, yy - 1, 3);

draw_set_font(fBattleHudContent);

var ranks = mBattle.field[@ FIELD_ALLY];
var size = 0;
for (var i = 0; i < FIELD_RANKS; ++i) {
	var rank = ranks[@ i];
	if (rank == noone)
		break;
	
	++size;
}

for (var i = 0; i < size; ++i) {
	var rank = ranks[@ i];
	var xx = floor(GUI_WIDTH/2 - size*COLUMN_WIDTH/2 + COLUMN_WIDTH*i + COLUMN_WIDTH/2);
	var yy = PADDING * 3;
	
	// Column Background
	draw_set_color(i % 2 == 0 ? c_black : c_white);
	draw_set_alpha(0.5);
	draw_rectangle(xx - COLUMN_WIDTH/2, yy, xx + COLUMN_WIDTH/2, GUI_HEIGHT - PADDING, false);
	draw_set_alpha(1);
	
	// Portrait
	draw_sprite_ext(sMonsterPortrait, rank[@ k_mon.class], xx, yy + PORTRAIT_HEIGHT + 12, 1, 1, 0, c_white, 1);
	
	// Awards List
	var totalExperience = rank[@ k_mon.experience];
	var awardList = awards[? rank];
	if (!is_undefined(awardList)) {
		for (var j = 0, jsize = ds_list_size(awardList); j < jsize; ++j) {
			var award = awardList[| j];
			var left = xx - COLUMN_WIDTH/2 + 12;
			var top = yy + PORTRAIT_HEIGHT + 12 + 12 + 24 + LINE_HEIGHT*j;
			var right = xx + COLUMN_WIDTH/2 - 12;
		
			var experience = battle_award_get_experience(award);
			totalExperience += experience;
		
			draw_set_color(c_white);
			draw_set_halign(fa_left);
			draw_text_outline(left, top, battle_award_get_name(award), 1, c_black, 4);
			draw_set_halign(fa_right);
			draw_text_outline(right, top, concat(experience > 0 ? "+" : "", experience), 1, c_black, 4);
			draw_set_halign(fa_left);
		}
	}
	
	// Experience Bar
	var level = rank[@ k_mon.level];
	var expLow, expHigh;
	while (true) {
		expLow = mon_get_level_experience(rank, level);
		expHigh = mon_get_level_experience(rank, level + 1);
		
		if (expHigh > totalExperience)
			break;
		
		++level;
	}
	
	var left = xx - COLUMN_WIDTH/2 + 12;
	var top = yy + sprite_get_height(sMonsterPortrait) + 24;
	var right = xx + COLUMN_WIDTH/2 - 12;
	var bottom = yy + sprite_get_height(sMonsterPortrait) + 24 + 12;
	var progressWidth = (totalExperience - expLow) / (expHigh - expLow)  * (right - left);
	draw_set_color(c_black);
	draw_rectangle(left, top, right, bottom, false);
	draw_set_color(c_white);
	draw_rectangle(left, top, right, bottom, true);
	draw_set_color(c_white);
	draw_rectangle(left, top, left + progressWidth, bottom, false);
	
	// Level
	draw_set_halign(fa_center);
	draw_text_outline(xx, yy + PORTRAIT_HEIGHT, concat("Level ", level), 1, c_black, 4);
	draw_set_halign(fa_left);
	
	// Level Up!
	draw_set_halign(fa_center);
	if (rank[@ k_mon.level] + 1 < level)
		draw_text_outline(xx, GUI_HEIGHT - PADDING - LINE_HEIGHT*2, concat("Level Up! x", rank[@ k_mon.level] - level), 1, c_black, 4);
	else if (rank[@ k_mon.level] < level)
		draw_text_outline(xx, GUI_HEIGHT - PADDING - LINE_HEIGHT*2, "Level Up!", 1, c_black, 4);
}