draw_set_font(fBattleHudContent);

PADDING = floor(GUI_WIDTH * 0.01);
FIELD_BOTTOM = floor(GUI_HEIGHT * 0.66);
LINE_HEIGHT = string_height("W");

// Background
draw_sprite(bgBattleEnvironment, 0, GUI_WIDTH * 0.5, FIELD_BOTTOM);

// Round Indicator
draw_set_font(fBattleIndicator);
var width = string_width(string(currentRound + 1));
var xx = floor(GUI_WIDTH / 2);
var yy = floor(PADDING + LINE_HEIGHT / 2);
draw_set_color(c_white);
draw_set_valign(fa_center);
draw_set_halign(fa_middle);
draw_text_outline(xx, yy, string(currentRound + 1), 2, c_black, 4);
draw_set_halign(fa_top);
draw_set_valign(fa_left);

draw_set_color(c_black);
draw_line_width(xx - width/2 - 8, yy - 1, xx - 128, yy - 1, 3);
draw_line_width(xx + width/2 + 8, yy - 1, xx + 128, yy - 1, 3);

// Field
battle_draw_ranks(FIELD_ALLY);
battle_draw_ranks(FIELD_FOE);

// Monster Specs
draw_set_font(fBattleHudContent);
draw_set_color(c_black);
draw_rectangle(0, FIELD_BOTTOM, GUI_WIDTH, GUI_HEIGHT, false);

if (stTurn_monster != noone) {
	var top = FIELD_BOTTOM + 24;
	var bottom = GUI_HEIGHT - 24;
	var left = PADDING*3;
	var right = GUI_WIDTH * 0.5 - PADDING;
	
	draw_set_color(c_white);
	
	// Name & Level
	draw_text(left + 8, top, concat(mon_get_name(stTurn_monster), " Lv. ", stTurn_monster[@ k_mon.level]));
	draw_line(left, top + LINE_HEIGHT, right, top + LINE_HEIGHT);
	
	// Stats
	draw_set_halign(fa_right);
	draw_text(left + 104 - 8, top + 40 + LINE_HEIGHT*0, "HP");
	draw_text(left + 104 - 8, top + 40 + LINE_HEIGHT*1, "STRENGTH");
	draw_text(left + 104 - 8, top + 40 + LINE_HEIGHT*2, "DEFENCE");
	draw_text(left + 104 - 8, top + 40 + LINE_HEIGHT*3, "SPEED");
	draw_text(left + 104 - 8, top + 40 + LINE_HEIGHT*4, "ACCURACY");
	draw_text(left + 104 - 8, top + 40 + LINE_HEIGHT*5, "CRITICAL");
	draw_text(left + 104 - 8, top + 40 + LINE_HEIGHT*6, "DODGE");
	draw_set_halign(fa_left);
	draw_text(left + 104 + 8, top + 40 + LINE_HEIGHT*0, concat(stTurn_monster[@ k_mon.hp], " / ", mon_get_stat(stTurn_monster, k_stats.hp)));
	draw_text(left + 104 + 8, top + 40 + LINE_HEIGHT*1, concat(mon_get_stat(stTurn_monster, k_stats.min_damage), " - ", mon_get_stat(stTurn_monster, k_stats.max_damage)));
	draw_text(left + 104 + 8, top + 40 + LINE_HEIGHT*2, string(mon_get_stat(stTurn_monster, k_stats.protection)));
	draw_text(left + 104 + 8, top + 40 + LINE_HEIGHT*3, string(mon_get_stat(stTurn_monster, k_stats.speed)));
	draw_text(left + 104 + 8, top + 40 + LINE_HEIGHT*4, string(mon_get_stat(stTurn_monster, k_stats.accuracy)));
	draw_text(left + 104 + 8, top + 40 + LINE_HEIGHT*5, string(mon_get_stat(stTurn_monster, k_stats.critical)));
	draw_text(left + 104 + 8, top + 40 + LINE_HEIGHT*6, string(mon_get_stat(stTurn_monster, k_stats.dodge)));
	
	// Abilities
	var abilities = stTurn_monster[@ k_mon.abilities];
	
	left = left + 196;
	var stride = ((right - left)/ABILITY_SLOTS);
	for (var i = 0; i < ABILITY_SLOTS; ++i) {
		var name;
		var ability = abilities[@ i];
			
		if (ability == noone) {
			name = "-";
			draw_set_color(c_gray);
		}
		else {
			name = ability[@ Ability.Name];
			var rankMask = ability[@ Ability.RankMask];
			draw_set_color((rankMask & (1<<stTurn_rank)) == 0 ? c_gray : c_white);
		}
			
		draw_set_halign(fa_center);
		draw_text(left + i*stride + stride/2, top, name);
		draw_set_halign(fa_left);
			
		if (i == stTurn_selectedAbility && ability != noone)
			ability_draw_description(ability, left, top + 40, right, bottom);
		
		if (i == stTurn_selectedAbility)
			draw_line(left + i*stride, top + LINE_HEIGHT - 1, left + (i+1)*stride, top + LINE_HEIGHT - 1);
	}
	
	draw_set_color(c_white);
	draw_line(left - 16, top + LINE_HEIGHT + 8, left - 16, bottom);
}

state_machine_draw();

// Debug
draw_set_color(c_white);
draw_set_font(fDebugConsole);
draw_set_valign(fa_bottom);
draw_text(0, GUI_HEIGHT, state_get_key());
draw_set_valign(fa_top);
