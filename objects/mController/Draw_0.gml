/// @desc DEBUG - Draw AABB

if (RELEASE_MODE) exit;

if (DBG_ShowAABB) {
    draw_set_color(c_red);
    with(all)
        draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, true);
}
