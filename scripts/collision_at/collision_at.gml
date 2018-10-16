/// @desc collision_at(x, y)
/// Returns if colliding with solid collidable
/// @param x real
/// @param y real

gml_pragma("forceinline");
return !place_free(argument0, argument1);

//var inst = instance_place(argument0, argument1, pCollidable);
//return inst != noone && inst.solid;
