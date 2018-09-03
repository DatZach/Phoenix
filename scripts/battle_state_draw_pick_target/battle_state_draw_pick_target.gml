/// @func battle_state_draw_pick_target()
/// STATE PickTarget

if (stTurn_targetRank == noone)
	return;

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