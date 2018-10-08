/// @func DamageAbilitySub_draw_target_description(ability, sub, source, target, left, top, right, bottom)
/// DRAW DamageAbilitySub
/// @context mBattle

var ability = argument0;
var sub = argument1;
var source = argument2;
var target = argument3;
var left = argument4;
var top = argument5;
var right = argument6;
var bottom = argument7;

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
var targetMask = ability[@ Ability.TargetMask];
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