/// @func battle_draw_ranks(rankId);
/// Draws ranks
/// @param rankId real FIELD_SELF, FIELD_FOE

var RANK_WIDTH = sprite_get_width(sMonsterPortrait);

var fieldId = argument0;

var ranks = field[@ fieldId];
for (var i = 0; i < FIELD_RANKS; ++i) {
	var rank = ranks[@ i];
	if (rank == noone)
		continue;
	
	var hp = rank[@ k_mon.hp];
	var maxHp = mon_get_stat(rank, k_stats.hp);
	var xx = fieldId == FIELD_SELF
		? floor(PADDING + FIELD_RANKS*RANK_WIDTH - i*RANK_WIDTH)
		: floor(GUI_WIDTH - PADDING - FIELD_RANKS*RANK_WIDTH + i*RANK_WIDTH);
	var yy = FIELD_BOTTOM - 64;
	
	// Portrait
	draw_sprite_ext(
		rank[@ k_mon.dead] ? sCorpsePortrait : sMonsterPortrait, rank[@ k_mon.class],
		xx, yy,
		fieldId == FIELD_SELF ? 1 : -1, 1, 0,
		rank[@ k_mon.hp] <= 0 && ((get_timer() / 1000 % 1500) > 1250) ? c_red : c_white, 1
	);
	
	// Health Bar
	draw_set_color(c_black);
	draw_rectangle(xx - 64 + 12, yy + 24, xx + 64 - 12, yy + 24 + 12, false);
	draw_set_color(rank[@ k_mon.dead] ? c_ltgray : c_red);
	if (hp > 0)
		draw_rectangle(xx - 64 + 13, yy + 24 + 1, floor(xx - 64 + 13 + (128 - 26) * (hp / maxHp)), yy + 24 + 11, false);

	// Status Effects
	if (rank[@ k_mon.hp] <= 0) {
		// TODO Enum for status effects
		draw_sprite(sIconStatusEffect, 4, xx - 64 + 15 + 4*(12 + 10), yy + 24 + 11 + 8);
	}

	// Active
	if (stTurn_monster == rank) {
		draw_set_color(c_white);
		draw_rectangle(xx - 64 + 12, yy + 8, xx + 64 - 12, yy + 8 + 8, false);
	}
}