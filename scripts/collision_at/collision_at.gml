/// @desc collision_at(x, y)
/// Returns if colliding with solid collidable
/// @param x real
/// @param y real

gml_pragma("forceinline");

var xx = argument0;
var yy = argument1;

var idx = tilemap_get_at_pixel(global.collisionLayerId, xx, yy);
if (idx == 0)
	return !place_free(argument0, argument1);
else if (idx == 1)
	return true;

var px = xx mod TILE_SIZE;
var py = yy mod TILE_SIZE;
switch(idx) {
	case 2:
		return point_in_rectangle(px, py, 12, 0, 24, 24)
			|| point_in_rectangle(px, py, 0, 12, 24, 24);
	case 3:
		return point_in_rectangle(px, py, 0, 0, 12, 24)
			|| point_in_rectangle(px, py, 0, 12, 24, 24);
	case 4:
		return point_in_rectangle(px, py, 0, 12, 24, 24);
	case 5:
		return point_in_rectangle(px, py, 0, 0, 24, 12)
			|| point_in_rectangle(px, py, 12, 0, 24, 24);
	case 6:
		return point_in_rectangle(px, py, 12, 0, 24, 24);
	case 7:
		return point_in_rectangle(px, py, 0, 0, 12, 12)
			|| point_in_rectangle(px, py, 12, 12, 24, 24);
	case 8:
		return point_in_rectangle(px, py, 12, 12, 24, 24);
	case 9:
		return point_in_rectangle(px, py, 0, 0, 24, 12)
			|| point_in_rectangle(px, py, 0, 0, 12, 24);
	case 10:
		return point_in_rectangle(px, py, 12, 0, 24, 24)
			|| point_in_rectangle(px, py, 0, 12, 12, 24);
	case 11:
		return point_in_rectangle(px, py, 0, 0, 12, 24);
	case 12:
		return point_in_rectangle(px, py, 0, 12, 12, 24);
	case 13:
		return point_in_rectangle(px, py, 0, 0, 24, 12);
	case 14:
		return point_in_rectangle(px, py, 12, 0, 24, 12);
	case 15:
		return point_in_rectangle(px, py, 0, 0, 12, 12);
	default:
		warn("Illegal tile collision; idx = ", idx);
		return false;
}

//var inst = instance_place(argument0, argument1, pCollidable);
//return inst != noone && inst.solid;
