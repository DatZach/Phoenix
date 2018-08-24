#macro FIELD_SELF 0
#macro FIELD_FOE 1
#macro FIELD_RANKS 4

// Variables
trainers = [];
field = [array_create(FIELD_RANKS, noone), array_create(FIELD_RANKS, noone)];
currentRound = 0;

stRound_finished = [];
stTurn_monster = noone;

state_machine_init();
state_create("Init", battle_state_init);
state_create("BeginRound", battle_state_round);
state_create("Round", battle_state_round);
state_create("Turn", battle_state_turn);
state_switch("Init");

trace(GUI_WIDTH, "x", GUI_HEIGHT);