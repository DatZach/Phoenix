/// @func HealAbilitySub_draw_description(ability, sub, left, top, right, bottom)
/// DRAW HealAbility
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
draw_text(left + 104 - 8, top + 40 + LINE_HEIGHT*1, "HEAL");
draw_set_halign(fa_left);
var healRange = heal_ability_sub_get_heal_range(ability, sub, stTurn_monster, noone);
draw_text(left + 104 + 8, top + 40 + LINE_HEIGHT*1, concat(healRange[0], " - ", healRange[1]));

return 40 + LINE_HEIGHT*2;