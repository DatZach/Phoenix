PADDING = GUI_WIDTH * 0.01;
FIELD_BOTTOM = GUI_HEIGHT * 0.66;

// Field
draw_sprite(bgBattleEnvironment, 0, GUI_WIDTH * 0.5, FIELD_BOTTOM);

battle_draw_ranks(FIELD_SELF);
battle_draw_ranks(FIELD_FOE);

// Monster Specs
draw_set_color(c_black);
draw_rectangle(0, FIELD_BOTTOM, GUI_WIDTH, GUI_HEIGHT, false);

// Debug
draw_set_color(c_white);
draw_set_valign(fa_bottom);
draw_text(0, GUI_HEIGHT, state_name);
draw_set_valign(fa_top);
