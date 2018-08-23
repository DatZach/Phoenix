// Variables
trainers = [];
field = [array_create(4, noone), array_create(4, noone)];
currentRound = 0;

stRound_finished = [];

state_machine_init();
state_create("Init", battle_state_init);
state_create("BeginRound", battle_state_round);
state_create("Round", battle_state_round);
state_create("Turn", battle_state_turn);
state_switch("Init");