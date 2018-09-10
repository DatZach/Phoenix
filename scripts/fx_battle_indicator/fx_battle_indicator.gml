/// @func fx_battle_indicator(target, icon, [message])
/// Shows an indicator message over target
/// @context mBattle
/// @param target Monster
/// @param type IndType
/// @param message var

// TODO Rename to fx_move_toast

enum IndType {
	Damage,
	Heal,
	Bleed,
	Poisoned,
	Stunned,
	Moved,
	DeathsDoor,
	DeathBlow,
	Dodge,
	
	Resist = $8000
}

var PADDING = floor(GUI_WIDTH * 0.01);
var FIELD_BOTTOM = floor(GUI_HEIGHT * 0.66);
var RANK_WIDTH = sprite_get_width(sMonsterPortrait);
var RANK_HEIGHT = sprite_get_height(sMonsterPortrait);

var target = argument[0];
var type = argument[1];
var message = argument_count > 2 ? argument[2] : "";

var fieldIdx = noone, rankIdx = noone;
for (var i = 0; i < 2; ++i) {
	var ranks = field[@ i];
	for (var j = 0; j < FIELD_RANKS; ++j) {
		var rank = ranks[@ j];
		if (rank == target) {
			fieldIdx = i;
			rankIdx = j;
			break;
		}
	}
}

if (fieldIdx == noone || rankIdx == noone)
	return;

var xx = fieldIdx == FIELD_ALLY
	? floor(PADDING + FIELD_RANKS*RANK_WIDTH - rankIdx*RANK_WIDTH)
	: floor(GUI_WIDTH - PADDING - FIELD_RANKS*RANK_WIDTH + rankIdx*RANK_WIDTH);
var yy = FIELD_BOTTOM - 64 - RANK_HEIGHT*0.75;

var offset = true;
while (offset) {
	offset = false;
	with (fxIndicator) {
		if (rectangle_in_rectangle(x - 64, y - 12, x + 64, y + 12,
								   xx - 64, yy - 12, xx + 64, yy + 12)) {
			yy += 32;
			offset = true;
		}
	}
}

var inst = instance_create_layer(xx, yy, LAYER_INSTANCES, fxIndicator);
inst.type = type;
inst.message = message;

camera_shake(cs_light);
