/// @func battle_state_begin_round();
/// STATE BeginRound

stRound_finished = [];
++currentRound;

state_switch("Round");
battle_check_end_conditions();