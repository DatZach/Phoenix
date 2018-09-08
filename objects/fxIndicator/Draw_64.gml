//float sqt = square(t);
//return sqt / (2.0f * (sqt - t) + 1.0f);

var t = alarm[0] / LIFETIME;
var a = power(sin(5 * t / pi), 2);
y -= a;

draw_set_font(fBattleIndicator);

var width = string_width(message);
var iconIdx = noone;
var offset = 0;

switch (type & ~IndType.Resist) {
	case IndType.Damage:
		draw_set_color(c_maroon);
		break;
	case IndType.Heal:
		draw_set_color(c_green);
		break;
	case IndType.Bleed:
		iconIdx = 0;
		draw_set_color(c_red);
		message = "Bleed";
		break;
	case IndType.Poisoned:
		iconIdx = 1;
		draw_set_color(c_purple);
		message = "Poisoned";
		break;
	case IndType.Stunned:
		iconIdx = 2;
		draw_set_color(c_yellow);
		message = "Stunned";
		break;
	case IndType.Moved:
		iconIdx = 3;
		draw_set_color(c_aqua);
		message = "Move";
		break;
	case IndType.DeathsDoor:
		iconIdx = 4;
		draw_set_color(c_white);
		message = "Death's Door";
		break;
	case IndType.Dodge:
		draw_set_color(c_ltgray);
		message = "Dodge!";
		break;
}

if ((type & IndType.Resist) == IndType.Resist)
	message = "Resist!";

if (iconIdx != noone) {
	offset = 32;
	width += 32;
}

draw_set_alpha(a);
if (iconIdx != noone)
	draw_sprite(sIconStatusEffect24, iconIdx, x - width / 2, y);

draw_text_outline(x - width / 2 + offset, y, string(message), 1, c_black, 4);
draw_set_alpha(1);
