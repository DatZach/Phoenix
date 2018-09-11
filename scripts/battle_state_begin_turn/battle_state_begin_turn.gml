/// @func battle_state_begin_turn()
/// STATE Begin Turn

// Begin Turn

// STATUS EFFECTS
var shouldSkipTurn = false;
var statusEffects = stTurn_monster[@ k_mon.status_effects];
for (var i = 0, len = ds_list_size(statusEffects); i < len; ++i) {
	var statusEffect = statusEffects[| i];
	shouldSkipTurn = status_effect_tick(statusEffect, stTurn_monster) || shouldSkipTurn;
}

// STATUS EFFECTS - Remove corpse if killed by status effect
if (stTurn_monster[@ k_mon.hp] <= 0) {
	var ranks = field[@ stTurn_targetField];
	if (stTurn_who == FIELD_ALLY)
		fx_battle_indicator(ranks[@ stTurn_targetRank], IndType.DeathBlow);
	
	ranks[@ stTurn_targetRank] = noone;
	shouldSkipTurn = true;
}

// CORPSE DECAY
if (stTurn_monster[@ k_mon.dead]) {
	stTurn_monster[@ k_mon.hp] -= ceil(mon_get_max_hp(stTurn_monster) * 0.33);
	if (stTurn_monster[@ k_mon.hp] <= 0) {
		var ranks = field[@ stTurn_targetField];
		ranks[@ stTurn_targetRank] = noone;
	}
	
	shouldSkipTurn = true;
}

if (shouldSkipTurn) {
	state_switch("Round");
	return;
}

state_switch("PickMove");
