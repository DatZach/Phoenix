/// @func hud_draw_overlay()
/// Draws the Overworld Overlay

draw_set_font(fPauseMenuContent);
LINE_HEIGHT = string_height("W");
var PORTRAIT_SIZE = 32;
var HEALTH_WIDTH = 240;

var xx = PADDING;
var yy = PADDING;

// Portrait
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(xx, yy, xx + PORTRAIT_SIZE, yy + PORTRAIT_SIZE, false);
draw_set_alpha(1);
draw_sprite_ext(
	sMonsterPortrait, oPlayer.activeMonster[@ k_mon.class],
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
	concat(mon_get_name(oPlayer.activeMonster), " Lv. ", oPlayer.activeMonster[@ k_mon.level]),
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
	xx + 1 + (HEALTH_WIDTH - 2 - xx) * (oPlayer.activeMonster[@ k_mon.hp] / mon_get_stat(oPlayer.activeMonster, k_stats.hp)), PORTRAIT_SIZE + 4 - 1,
	false
);

// Party Status
xx = PADDING + (FIELD_RANKS-1)*9;
yy = PADDING + PORTRAIT_SIZE + 4;

var party = trainer_get_party(oPlayer.trainer);
var partySize = array_length_1d(party);
for (var i = 0; i < FIELD_RANKS; ++i) {
	draw_set_alpha(0.5);
	draw_set_color(c_black);
	draw_rectangle(xx - i*9, yy, xx - i*9 + 5, yy + 5, false);
	draw_set_alpha(1);
	
	if (i >= partySize)
		continue;
	
	// TODO Indicate low health and status effects
	draw_set_color(c_white);
	draw_rectangle(xx - i*9 + 1, yy + 1, xx - i*9 + 4, yy + 4, false);
	
	var monster = party[@ i];
	if (oPlayer.activeMonster == monster)
		draw_rectangle(xx - i*9, yy, xx - i*9 + 5, yy + 5, true);
}

// Overworld Ability
xx = PADDING + PORTRAIT_SIZE + PADDING;
yy = PORTRAIT_SIZE + 4 + 4;
var class = oPlayer.activeMonster[@ k_mon.class];
var dbMonster = global.dbMonsters[| class];

var oaKey = dbMonster[@ k_db_mon.overworld_ability];
if (oaKey != undefined) {
	draw_set_color(c_white);
	draw_text_outline(
		xx, yy,
		concat("[", input_get_name(global.k_action), "] ", oaKey),
		1, c_black, 4
	);
}

// Equipped Item
xx = PADDING + PORTRAIT_SIZE + PADDING + 1 + HEALTH_WIDTH + PADDING;
yy = PADDING + PADDING;

var equippedItem = equip_get_item();
if (equippedItem != noone) {
	var itemMeta = global.dbItems[? equippedItem[@ k_item.key]];
	draw_sprite(sPortraitItem, itemMeta[@ k_db_item.img_index], xx - 8, yy + 8);
	draw_set_color(c_white);
	draw_text_outline(
		xx + 16, yy,
		concat("[", input_get_name(global.k_back), "] Use ", itemMeta[@ k_db_item.key]),
		1, c_black, 4
	);
}
