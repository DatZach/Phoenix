var lt = trainers[@ 0];
var ltp = lt[@ k_trainer.party];
var rt = trainers[@ 1];
var rtp = rt[@ k_trainer.party];
var l = field[@ 0];
var r = field[@ 1];
l[@ 0] = ltp[| 0];
r[@ 0] = rtp[| 0];

state_switch("Round");
