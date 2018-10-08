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

ability_draw_target_description(ability, source, target, left, top, right, bottom);
