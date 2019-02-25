draw_sprite(sShadow16, 0, x, y + 8);

var item = global.dbItems[? itemKey];
draw_sprite_ext(
    sprite_index, item[@ k_db_item.img_index],
    x, y - abs(sin((offset + (get_timer() / 1000)) / 500) * 5),
    1, 1, 0, c_white, 1
);
