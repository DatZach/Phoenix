if (instance_find(object_index, 0) != id) exit;

draw_set_font(fBattleHudContent);

PADDING = floor(GUI_WIDTH * 0.01);
height = floor(GUI_HEIGHT * 0.68);

var left = PADDING;
var top = floor(GUI_HEIGHT/2 - height/2);
var right = GUI_WIDTH - PADDING;
var bottom = floor(GUI_HEIGHT/2 + height/2);

// Light Box
draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(0, 0, GUI_WIDTH, GUI_HEIGHT, false);
draw_set_alpha(1);

// Panel
draw_set_color(c_black);
draw_set_alpha(0.85);
draw_rectangle(left, top, right, bottom, false);
draw_set_color(c_white);
draw_set_alpha(1);
draw_rectangle(left, top, right, bottom, true);
draw_line(left, top + 64 + PADDING*2, right, top + 64 + PADDING*2);
draw_line(left, bottom - LINE_HEIGHT - PADDING*2, right, bottom - LINE_HEIGHT - PADDING*2);

// Heading
draw_sprite_ext(
	sMonsterPortrait, monster[@ k_mon.class],
	left + PADDING + 64/2, top + 64 + PADDING,
	64 / sprite_get_width(sMonsterPortrait), 64 / sprite_get_height(sMonsterPortrait),
	0, c_white, 1
);

draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_text_outline(
	left + 64 + PADDING*2, top + 64/2 + PADDING,
	concat(mon_get_name(monster), "\nLevel ", monster[@ k_mon.level]),
	1, c_black, 4
);
draw_set_valign(fa_top);

// Footer
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
draw_text_outline(
	right - PADDING, bottom - LINE_HEIGHT/2 - PADDING,
	concat(monster[@ k_mon.ap], " AP"),
	1, c_black, 4
);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

// Ability Tree
top = top + 64 + PADDING*2;
bottom = bottom - LINE_HEIGHT - PADDING*2;

if (!surface_exists(surface))
	surface = surface_create(right - left, bottom - top);
	
surface_set_target(surface);

// Nodes
for (var i = 0, isize = ds_list_size(nodes); i < isize; ++i) {
	var node = nodes[| i];
	var ability = node[@ AbilityNode.Ability];
	var xx = node[@ AbilityNode.X];
	var yy = node[@ AbilityNode.Y];
	
	var isUnlocked = true;
	var dependencies = ability[@ Ability.Dependencies];
	if (ds_exists(dependencies, ds_type_list)) {
		for (var j = 0, jsize = ds_list_size(dependencies); j < jsize; ++j) {
			var dependency = dependencies[| j];
			if (ds_list_find_index(monster[@ k_mon.unlocked_abilities], dependency) == -1) {
				isUnlocked = false;
				break;
			}
		}
	}
	
	draw_set_color(c_dkgray);
	draw_rectangle(xx, yy, xx + ABILITY_WIDTH, yy + ABILITY_HEIGHT, false);
	
	if (node == selectedNode)
		draw_set_color(c_aqua);
	else if (ds_list_find_index(monster[@ k_mon.unlocked_abilities], ability[@ Ability.Key]) != -1)
		draw_set_color(c_yellow);
	else
		draw_set_color(isUnlocked ? c_white : c_gray);
		
	draw_rectangle(xx, yy, xx + ABILITY_WIDTH, yy + ABILITY_HEIGHT, true);
	
	draw_set_color(isUnlocked ? c_white : c_gray);
	draw_text(xx + PADDING, yy + PADDING, ability[@ Ability.Name]);
}

// Connections
draw_set_color(c_white);
for (var i = 0, isize = ds_list_size(connections); i < isize; ++i) {
	var connection = connections[| i];
	var node1 = nodes[| connection[@ 0]];
	var node2 = nodes[| connection[@ 1]];
	var xx1 = node1[@ AbilityNode.X] + ABILITY_WIDTH;
	var yy1 = node1[@ AbilityNode.Y] + ABILITY_HEIGHT/2;
	var xx2 = node2[@ AbilityNode.X];
	var yy2 = node2[@ AbilityNode.Y] + ABILITY_HEIGHT/2;
	var stride = xx2 - xx1;
	
	draw_bezier_cubic(
		xx1, yy1, xx1 + stride, yy1,
		xx2 - stride, yy2, xx2, yy2,
		12, 1
	);
}

surface_reset_target();

draw_surface(surface, left, top);

























