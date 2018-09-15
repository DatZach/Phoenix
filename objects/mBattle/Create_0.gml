#macro FIELD_NONE noone
#macro FIELD_ALLY 0
#macro FIELD_FOE 1
#macro FIELD_RANKS 4

// Variables
trainers = [];
field = [array_create(FIELD_RANKS, noone), array_create(FIELD_RANKS, noone)];
currentRound = 0;
endStatus = noone;
awards = ds_map_create();
expectedRounds = 0;

stRound_finished = [];

stTurn_who = noone;
stTurn_monster = noone;
stTurn_rank = noone;
stTurn_selectedAbility = 0
stTurn_targetField = noone;
stTurn_targetRank = noone;

state_machine_init();
state_create("Init", battle_state_init);
state_create("BeginRound", battle_state_begin_round);
state_create("Round", battle_state_round);
state_create("BeginTurn", battle_state_begin_turn);
state_create("PickMove", battle_state_pick_move);
state_create("PickTarget", battle_state_pick_target, battle_state_draw_pick_target);
state_create("UseAbility", battle_state_use_ability);
state_create("End", battle_state_end);
state_switch("Init");
