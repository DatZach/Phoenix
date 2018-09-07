/// @func HealAbility_draw(ability, left, top, right, bottom)
/// DRAW HealAbility
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
draw_set_halign(fa_right);
draw_text(right - 16, top + 40 + LINE_HEIGHT*0 - 2, "HEAL");
draw_set_halign(fa_right);
draw_text(left + 104 - 8, top + 40 + LINE_HEIGHT*1, "MAGNITUDE");
draw_set_halign(fa_left);
draw_text(left + 104 + 8, top + 40 + LINE_HEIGHT*1, concat(ability[@ HealAbility.Magnitude] * 100, "%"));
