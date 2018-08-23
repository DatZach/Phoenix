draw_text(0, 0, state_name);

var PADDING = GUI_WIDTH * 0.05;
var FIELD_BOTTOM = GUI_HEIGHT * 0.66;

var lField = field[@ 0];
for (var i = 0; i < 4; ++i) {
	var lRank = lField[@ i];
	if (lRank == noone)
		continue;
		
	draw_sprite(
		sMonsterPortrait, lRank[@ k_mon.class],
		PADDING + 4*128 - i*128, FIELD_BOTTOM - 128
	);
}

var rField = field[@ 0];
for (var i = 0; i < 4; ++i) {
	var rRank = rField[@ i];
	if (rRank == noone)
		continue;
	
	draw_sprite(
		sMonsterPortrait, rRank[@ k_mon.class],
		GUI_WIDTH - PADDING - 4*128 + i*128, FIELD_BOTTOM - 128
	);
}
