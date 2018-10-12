/// @func SkipAbilitySub_draw_description(ability, sub, left, top, right, bottom)
/// DRAW SkipAbility
/// @context mBattle

var ability = argument0;
var sub = argument1;
var left = argument2;
var top = argument3;
var right = argument4;
var bottom = argument5;

var statusName;
switch(sub[@ AddStatusAbilitySub.StatusEffect]) {
	case STATUS_EFFECT_BLEED: statusName = "BLEED"; break;
	case STATUS_EFFECT_POISON: statusName = "POISON"; break;
	case STATUS_EFFECT_STUN: statusName = "STUN"; break;
	case STATUS_EFFECT_MOVE: statusName = "MOVE"; break;
	case STATUS_EFFECT_GUARD: statusName = "GUARD"; break;
	case STATUS_EFFECT_BUFF: statusName = "BUFF"; break;
	case STATUS_EFFECT_DEBUFF: statusName = "DEBUFF"; break;
	default: statusName = "<UNKNOWN>"; break;
}

draw_set_color(c_white);
draw_set_halign(fa_right);
draw_text(right - 16, top + LINE_HEIGHT*0 - 2, "STATUS");
draw_set_halign(fa_right);
draw_text(left + 104 - 8, top + LINE_HEIGHT*0, statusName);
draw_set_halign(fa_left);
draw_text(left + 104 + 8, top + LINE_HEIGHT*0, concat(sub[@ AddStatusAbilitySub.Accuracy], "% Base"));

return LINE_HEIGHT*1;