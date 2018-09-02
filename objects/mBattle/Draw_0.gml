PADDING = floor(GUI_WIDTH * 0.01);
FIELD_BOTTOM = floor(GUI_HEIGHT * 0.66);

// Field
draw_sprite(bgBattleEnvironment, 0, GUI_WIDTH * 0.5, FIELD_BOTTOM);

battle_draw_ranks(FIELD_SELF);
battle_draw_ranks(FIELD_FOE);

// Monster Specs
draw_set_color(c_black);
draw_rectangle(0, FIELD_BOTTOM, GUI_WIDTH, GUI_HEIGHT, false);

if (stTurn_monster != noone) {
	var top = FIELD_BOTTOM + 24;
	var bottom = GUI_HEIGHT - 24;
	var left = PADDING*3;
	var right = GUI_WIDTH * 0.5 - PADDING;
	
	draw_set_color(c_white);
	draw_set_font(fBattleHudContent);
	var lineHeight = string_height("W");
	
	// Name & Level
	draw_text(left + 8, top, concat(mon_get_name(stTurn_monster), " Lv. ", stTurn_monster[@ k_mon.level]));
	draw_line(left, top + lineHeight, right, top + lineHeight);
	
	// Stats
	draw_set_halign(fa_right);
	draw_text(left + 104 - 8, top + 40 + lineHeight*0, "HP");
	draw_text(left + 104 - 8, top + 40 + lineHeight*1, "STRENGTH");
	draw_text(left + 104 - 8, top + 40 + lineHeight*2, "DEFENCE");
	draw_text(left + 104 - 8, top + 40 + lineHeight*3, "SPEED");
	draw_text(left + 104 - 8, top + 40 + lineHeight*4, "ACCURACY");
	draw_text(left + 104 - 8, top + 40 + lineHeight*5, "CRITICAL");
	draw_text(left + 104 - 8, top + 40 + lineHeight*6, "DODGE");
	draw_set_halign(fa_left);
	draw_text(left + 104 + 8, top + 40 + lineHeight*0, concat(stTurn_monster[@ k_mon.hp], " / ", mon_get_stat(stTurn_monster, k_stats.hp)));
	draw_text(left + 104 + 8, top + 40 + lineHeight*1, concat(mon_get_stat(stTurn_monster, k_stats.min_damage), " - ", mon_get_stat(stTurn_monster, k_stats.max_damage)));
	draw_text(left + 104 + 8, top + 40 + lineHeight*2, string(mon_get_stat(stTurn_monster, k_stats.protection)));
	draw_text(left + 104 + 8, top + 40 + lineHeight*3, string(mon_get_stat(stTurn_monster, k_stats.speed)));
	draw_text(left + 104 + 8, top + 40 + lineHeight*4, string(mon_get_stat(stTurn_monster, k_stats.accuracy)));
	draw_text(left + 104 + 8, top + 40 + lineHeight*5, string(mon_get_stat(stTurn_monster, k_stats.critical)));
	draw_text(left + 104 + 8, top + 40 + lineHeight*6, string(mon_get_stat(stTurn_monster, k_stats.dodge)));
	
	// Abilities
	var abilities = stTurn_monster[@ k_mon.abilities];
	
	left = left + 196;
	var stride = ((right - left)/6);
	for (var i = 0; i < 6; ++i) {
		if (i < 4) {
			var name;
			var ability = i < 4 ? abilities[@ i] : noone;
			
			if (ability == noone) {
				name = "-";
				draw_set_color(c_gray);
			}
			else {
				name = ability[@ Ability.Name];
				var rankMask = ability[@ Ability.RankMask];
				draw_set_color((rankMask & (1<<i)) == 0 ? c_gray : c_white);
			}
			
			draw_set_halign(fa_center);
			draw_text(left + i*stride + stride/2, top, name);
			draw_set_halign(fa_left);
			
			if (i == stTurn_selectedAbility && ability != noone) {
				var rankMask = ability[@ Ability.RankMask];
				for (var j = 0; j < 4; ++j) {
					draw_set_color((rankMask & (1<<j)) == 0 ? c_gray : c_white);
					draw_circle(left + 104 - 16 - j*20, top + 40 + lineHeight*0 + 8, 8, false);
				}
				
				var rankMask = ability[@ Ability.TargetMask];
				for (var j = 0; j < 4; ++j) {
					draw_set_color((rankMask & (1<<j)) == 0 ? c_gray : c_white);
					draw_circle(left + 104 + 16 + j*20, top + 40 + lineHeight*0 + 8, 8, false);
				}
				
				draw_set_color(c_white);
				draw_set_halign(fa_right);
				draw_text(right - 16, top + 40 + lineHeight*0 - 2, "ATTACK");
				draw_set_halign(fa_right);
				draw_text(left + 104 - 8, top + 40 + lineHeight*1, "ACCURACY");
				draw_text(left + 104 - 8, top + 40 + lineHeight*2, "DAMAGE");
				draw_text(left + 104 - 8, top + 40 + lineHeight*3, "CRITICAL");
				draw_set_halign(fa_left);
				draw_text(left + 104 + 8, top + 40 + lineHeight*1, string(ability[@ AttackAbility.Accuracy]));
				draw_text(left + 104 + 8, top + 40 + lineHeight*2, concat("+", (ability[@ AttackAbility.DamageModifier] - 1) * 100, "%"));
				draw_text(left + 104 + 8, top + 40 + lineHeight*3, concat("+", ability[@ AttackAbility.CriticalModifier], "%"));
			}
		}
		else if (i == 4) {
			draw_set_color(c_white);
			draw_set_halign(fa_center);
			draw_text(left + i*stride + stride/2,  top, "Move");
			draw_set_halign(fa_left);
		}
		else if (i == 5) {
			draw_set_color(c_white);
			draw_set_halign(fa_center);
			draw_text(left + i*stride + stride/2,  top, "Skip");
			draw_set_halign(fa_left);
		}
		
		if (i == stTurn_selectedAbility)
			draw_line(left + i*stride, top + lineHeight - 1, left + (i+1)*stride, top + lineHeight - 1);
	}
	
	draw_line(left - 16, top + lineHeight + 8, left - 16, bottom);
}

// Pick Target
if (state == battle_state_pick_target && stTurn_targetRank != noone) {
	var RANK_WIDTH = sprite_get_width(sMonsterPortrait);
	var top = FIELD_BOTTOM + 24;
	var bottom = GUI_HEIGHT - 24;
	var left = GUI_WIDTH * 0.5 + PADDING;
	var right = GUI_WIDTH - PADDING*3;
	
	var source = stTurn_monster;
	var ranks = field[@ stTurn_targetField];
	var target = ranks[@ stTurn_targetRank];
	var abilities = stTurn_monster[@ k_mon.abilities];
	var ability = abilities[@ stTurn_selectedAbility];
	var targetMask = ability[@ Ability.TargetMask];
	
	var xx = stTurn_targetField == FIELD_SELF
		? floor(PADDING + FIELD_RANKS*RANK_WIDTH - stTurn_targetRank*RANK_WIDTH)
		: floor(GUI_WIDTH - PADDING - FIELD_RANKS*RANK_WIDTH + stTurn_targetRank*RANK_WIDTH);
	var yy = FIELD_BOTTOM - 64;
	
	draw_set_color(c_red);
	draw_rectangle(xx - 64 + 12, yy + 8, xx + 64 - 12, yy + 8 + 8, false);
	
	// Name & Level
	draw_set_color(c_white);
	draw_text(left + 8, top, concat(mon_get_name(target), " Lv. ", target[@ k_mon.level]));
	draw_line(left, top + lineHeight, right, top + lineHeight);
	
	// Stats
	draw_set_halign(fa_right);
	draw_text(left + 104 - 8, top + 40 + lineHeight*0, "HP");
	draw_text(left + 104 - 8, top + 40 + lineHeight*1, "DODGE");
	draw_text(left + 104 - 8, top + 40 + lineHeight*2, "SPEED");
	draw_text(left + 104 - 8, top + 40 + lineHeight*3, "STUN RESIST");
	draw_text(left + 104 - 8, top + 40 + lineHeight*4, "POISON RESIST");
	draw_text(left + 104 - 8, top + 40 + lineHeight*5, "BLEED RESIST");
	draw_text(left + 104 - 8, top + 40 + lineHeight*6, "MOVE RESIST");
	draw_set_halign(fa_left);
	draw_text(left + 104 + 8, top + 40 + lineHeight*0, concat(target[@ k_mon.hp], " / ", mon_get_stat(target, k_stats.hp)));
	draw_text(left + 104 + 8, top + 40 + lineHeight*1, string(mon_get_stat(target, k_stats.dodge)));
	draw_text(left + 104 + 8, top + 40 + lineHeight*2, string(mon_get_stat(stTurn_monster, k_stats.speed)));
	draw_text(left + 104 + 8, top + 40 + lineHeight*3, concat(mon_get_stat(stTurn_monster, k_stats.stun_resist), "%"));
	draw_text(left + 104 + 8, top + 40 + lineHeight*4, concat(mon_get_stat(stTurn_monster, k_stats.poison_resist), "%"));
	draw_text(left + 104 + 8, top + 40 + lineHeight*5, concat(mon_get_stat(stTurn_monster, k_stats.bleed_resist), "%"));
	draw_text(left + 104 + 8, top + 40 + lineHeight*6, concat(mon_get_stat(stTurn_monster, k_stats.move_resist), "%"));
	
	// Move Predictions
	if ((targetMask & (1<<stTurn_targetRank)) != 0) {
		left = left + 196;
		
		draw_set_color(c_white);
		draw_line(left - 16, top + lineHeight + 8, left - 16, bottom);
		
		draw_set_color(c_yellow);
		draw_set_halign(fa_right);
		//draw_text(right - 16, top + 40 + lineHeight*0 - 2, "HIT CHANCE");
		draw_set_halign(fa_right);
		draw_text(left + 104 - 8, top + 40 + lineHeight*1, "HIT CHANCE");
		draw_text(left + 104 - 8, top + 40 + lineHeight*2, "CRIT CHANCE");
		draw_text(left + 104 - 8, top + 40 + lineHeight*3, "DAMAGE");
		draw_set_halign(fa_left);
		
		var hitChance = attack_ability_get_hit_chance(ability, source, target);
		if (hitChance == 100) hitChance = 95;
		draw_text(left + 104 + 8, top + 40 + lineHeight*1, concat(hitChance, "%"));
		var critChance = attack_ability_get_critical_chance(ability, source);
		draw_text(left + 104 + 8, top + 40 + lineHeight*2, concat(critChance, "%"));
		var dmgRange = attack_ability_get_damage_range(ability, source, target);
		draw_text(left + 104 + 8, top + 40 + lineHeight*3, concat(dmgRange[0], " - ", dmgRange[1]));
	}
}

// Debug
draw_set_color(c_white);
draw_set_font(fDebugConsole);
draw_set_valign(fa_bottom);
draw_text(0, GUI_HEIGHT, state_name);
draw_set_valign(fa_top);
