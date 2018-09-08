/// @func Captureability_draw_description(ability, left, top, right, bottom)
/// DRAW CaptureAbility
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
for (var i = 0; i < 3; ++i) {
	if ((rankMask & (1<<(i+4))) == 0)
		continue;
	
	var xx = left + 104 + 16 + i*20;
	var yy = top + 40 + LINE_HEIGHT*0;
	draw_set_color(c_white);
	draw_line_width(xx, yy + 8, xx + 20, yy + 8, 4);
}

for (var i = 0; i < 4; ++i) {
	draw_set_color((rankMask & (1<<i)) == 0 ? c_gray : c_white);
	draw_circle(left + 104 + 16 + i*20, top + 40 + LINE_HEIGHT*0 + 8, 8, false);
}

draw_set_color(c_white);
draw_text(left + 8, top + 40 + LINE_HEIGHT*1, "Attempt to capture Foe.");
