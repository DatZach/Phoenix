/// @func SkipAbility_draw_description(ability, left, top, right, bottom)
/// DRAW SkipAbility
/// @context mBattle

var ability = argument0;
var left = argument1;
var top = argument2;
var right = argument3;
var bottom = argument4;

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
draw_text(left + 104 + 8, top + 40 + LINE_HEIGHT*2, string(ability[@ MoveAbility.Distance]));
