#macro FIELD_SELF 0
#macro FIELD_FOE 1
#macro FIELD_RANKS 4

// Variables
trainers = [];
field = [array_create(FIELD_RANKS, noone), array_create(FIELD_RANKS, noone)];
currentRound = 0;

stRound_finished = [];

stTurn_who = noone;
stTurn_monster = noone;
stTurn_selectedAbility = 0
stTurn_targetField = noone;
stTurn_targetRank = noone;

state_machine_init();
state_create("Init", battle_state_init);
state_create("BeginRound", battle_state_begin_round);
state_create("Round", battle_state_round);
state_create("Turn", battle_state_turn);
state_create("PickMove", battle_state_pick_move);
state_create("PickTarget", battle_state_pick_target);
state_create("UseAbility", battle_state_use_ability);
state_switch("Init");
