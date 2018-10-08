/// @func SkipAbilitySub_draw_description(ability, sub, left, top, right, bottom)
/// DRAW SkipAbility
/// @context mBattle

var ability = argument0;
var sub = argument1;
var left = argument2;
var top = argument3;
var right = argument4;
var bottom = argument5;

var rankMask = ability[@ Ability.RankMask];
for (var i = 0; i < 4; ++i) {
	draw_set_color((rankMask & (1<<i)) == 0 ? c_gray : c_white);
	draw_circle(left + 104 - 16 - i*20, top + 40 + LINE_HEIGHT*0 + 8, 8, false);
}

var rankMask = ability[@ Ability.TargetMask];
for (var i = 0; i < 4; ++i) {
	draw_set_color((rankMask & (1<<i)) == 0 ? c_gray : c_white);
	draw_circle(left + 104 + 16 + 4*20 - i*20, top + 40 + LINE_HEIGHT*0 + 8, 8, false);
}

draw_set_color(c_white);
draw_text(left + 8, top + 40 + LINE_HEIGHT*1, "Change position among ranks.");
draw_set_halign(fa_right);
draw_text(left + 104 - 8, top + 40 + LINE_HEIGHT*2, "RANGE");
draw_set_halign(fa_left);
draw_text(left + 104 + 8, top + 40 + LINE_HEIGHT*2, string(sub[@ MoveAbilitySub.Distance]));

return 40 + LINE_HEIGHT*3;
