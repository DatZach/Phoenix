var lt = trainers[@ 0];
var ltp = lt[@ k_trainer.party];
var rt = trainers[@ 1];
var rtp = rt[@ k_trainer.party];
var l = field[@ 0];
var r = field[@ 1];
l[@ 0] = ltp[| 1];
l[@ 1] = ltp[| 0];
r[@ 0] = rtp[| 0];
r[@ 1] = rtp[| 1];
r[@ 2] = rtp[| 2];
r[@ 3] = rtp[| 3];

state_switch("Round");
