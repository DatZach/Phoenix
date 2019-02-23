/// @desc Input

if (input_check_pressed(global.k_action))
	mon_use_overworld_ability(selectedMonster);

var dir = input_check_pressed(global.k_bumper_left) - input_check_pressed(global.k_bumper_right);
if (dir != 0) {
	var party = trainer_get_party(oPlayer.trainer);
	var partySize = array_length_1d(party);

	var i = 0;
	for (; i < partySize; ++i) {
		if (party[@ i] == selectedMonster)
			break;
	}

	i = clamp_wrap(i + dir, 0, partySize - 1);
	selectedMonster = party[@ i];
}