var console = argument0;
var arguments = argument1;
    
DBG_ShowAABB = !DBG_ShowAABB;
layer_set_visible(layer_get_id(LAYER_COLLISIONS), DBG_ShowAABB);