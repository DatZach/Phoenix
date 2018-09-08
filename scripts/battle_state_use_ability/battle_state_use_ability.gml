/// @func battle_state_use_ability();
/// STATE Use Ability

// NOTE Set Round state so that the .use() function can change it to
//		another state if desired
state_switch("Round");

var abilities = stTurn_monster[@ k_mon.abilities];
var ability = abilities[@ stTurn_selectedAbility];
var targetMask = ability[@ Ability.TargetMask];

if (stTurn_targetField != FIELD_NONE) {
	var ranks = field[@ stTurn_targetField];
	for (var i = 0; i < FIELD_RANKS; ++i) {
		var l = floor(min(i, stTurn_targetRank));
		var h = floor(max(i, stTurn_targetRank)) - 1;
		var mask = ((2 << (h-l)) - 1) << l << 4;

		if (mask != 0 && (targetMask & mask) != mask && i != stTurn_targetRank)
			continue;
	
		var target = ranks[@ i];
		if (target == noone)
			break;
		
		ability_use(ability, stTurn_monster, target);
	}
}
else
	ability_use(ability, stTurn_monster, noone);
