/// @func battle_state_draw_pick_target()
/// STATE DRAW PickTarget

if (stTurn_who != FIELD_ALLY || stTurn_targetRank == noone)
	return;

var RANK_WIDTH = sprite_get_width(sMonsterPortrait);
var top = FIELD_BOTTOM + 24;
var bottom = GUI_HEIGHT - 24;
var left = GUI_WIDTH * 0.5 + PADDING;
var right = GUI_WIDTH - PADDING*3;

var source = stTurn_monster;
var target, ranks;
if (stTurn_targetField != noone) {
	ranks = field[@ stTurn_targetField];
	target = ranks[@ stTurn_targetRank];
}
else
	target = noone;

if (source == noone ||  target == noone)
	return;

var abilities = stTurn_monster[@ k_mon.abilities];
var ability = abilities[@ stTurn_selectedAbility];
var targetMask = ability[@ Ability.TargetMask];

for (var i = 0; i < FIELD_RANKS; ++i) {
	var l = floor(min(i, stTurn_targetRank));
	var h = floor(max(i, stTurn_targetRank)) - 1;
	var mask = ((2 << (h-l)) - 1) << l << 4;

	if (mask != 0 && (targetMask & mask) != mask && i != stTurn_targetRank)
		continue;
	
	if (ranks[@ i] == noone)
		break;
	
	var xx = stTurn_targetField == FIELD_ALLY
		? floor(PADDING + FIELD_RANKS*RANK_WIDTH - i*RANK_WIDTH)
		: floor(GUI_WIDTH - PADDING - FIELD_RANKS*RANK_WIDTH + i*RANK_WIDTH);
	var yy = FIELD_BOTTOM - 64;
	
	draw_set_color(c_red);
	draw_rectangle(xx - 64 + 12, yy + 8, xx + 64 - 12, yy + 8 + 8, false);
	
	if ((targetMask & 0xF0) != 0 && i == stTurn_targetRank) {
		draw_set_color(c_white);
		draw_rectangle(xx - 64 + 12, yy + 8, xx + 64 - 12, yy + 8 + 8, false);
	}
}

// TODO ability_draw_target_description()
var subs = ability[@ Ability.Sub];
for (var i = 0, isize = ds_list_size(subs); i < isize; ++i) {
	var sub = subs[| i];
	if (sub[@ AbilitySub.Type] != ABILITY_ATTACK)
		continue;
		
	// Name & Level
	draw_set_color(c_white);
	draw_text(left + 8, top, concat(mon_get_name(target), " Lv. ", target[@ k_mon.level]));
	draw_line(left, top + LINE_HEIGHT, right, top + LINE_HEIGHT);

	// Stats
	draw_set_halign(fa_right);
	draw_text(left + 104 - 8, top + 40 + LINE_HEIGHT*0, "HP");
	draw_text(left + 104 - 8, top + 40 + LINE_HEIGHT*1, "DODGE");
	draw_text(left + 104 - 8, top + 40 + LINE_HEIGHT*2, "SPEED");
	draw_text(left + 104 - 8, top + 40 + LINE_HEIGHT*3, "STUN RESIST");
	draw_text(left + 104 - 8, top + 40 + LINE_HEIGHT*4, "POISON RESIST");
	draw_text(left + 104 - 8, top + 40 + LINE_HEIGHT*5, "BLEED RESIST");
	draw_text(left + 104 - 8, top + 40 + LINE_HEIGHT*6, "MOVE RESIST");
	draw_set_halign(fa_left);
	draw_text(left + 104 + 8, top + 40 + LINE_HEIGHT*0, concat(target[@ k_mon.hp], " / ", mon_get_stat(target, k_stats.hp)));
	draw_text(left + 104 + 8, top + 40 + LINE_HEIGHT*1, string(mon_get_stat(target, k_stats.dodge)));
	draw_text(left + 104 + 8, top + 40 + LINE_HEIGHT*2, string(mon_get_stat(stTurn_monster, k_stats.speed)));
	draw_text(left + 104 + 8, top + 40 + LINE_HEIGHT*3, concat(mon_get_stat(stTurn_monster, k_stats.stun_resist), "%"));
	draw_text(left + 104 + 8, top + 40 + LINE_HEIGHT*4, concat(mon_get_stat(stTurn_monster, k_stats.poison_resist), "%"));
	draw_text(left + 104 + 8, top + 40 + LINE_HEIGHT*5, concat(mon_get_stat(stTurn_monster, k_stats.bleed_resist), "%"));
	draw_text(left + 104 + 8, top + 40 + LINE_HEIGHT*6, concat(mon_get_stat(stTurn_monster, k_stats.move_resist), "%"));

	// Move Predictions
	if ((targetMask & (1<<stTurn_targetRank)) != 0) {
		left = left + 196;
		
		draw_set_color(c_white);
		draw_line(left - 16, top + LINE_HEIGHT + 8, left - 16, bottom);
		
		draw_set_color(c_yellow);
		draw_set_halign(fa_right);
		draw_text(left + 104 - 8, top + 40 + LINE_HEIGHT*1, "HIT CHANCE");
		draw_text(left + 104 - 8, top + 40 + LINE_HEIGHT*2, "CRIT CHANCE");
		draw_text(left + 104 - 8, top + 40 + LINE_HEIGHT*3, "DAMAGE");
		draw_set_halign(fa_left);
	
		var hitChance = damage_ability_sub_get_hit_chance(ability, sub, source, target);
		if (hitChance == 100) hitChance = 95;
		draw_text(left + 104 + 8, top + 40 + LINE_HEIGHT*1, concat(hitChance, "%"));
		var critChance = damage_ability_sub_get_critical_chance(ability, sub, source);
		draw_text(left + 104 + 8, top + 40 + LINE_HEIGHT*2, concat(critChance, "%"));
		var dmgRange = damage_ability_sub_get_damage_range(ability, sub, source, target);
		draw_text(left + 104 + 8, top + 40 + LINE_HEIGHT*3, concat(dmgRange[0], " - ", dmgRange[1]));
	}
	
	break;
}