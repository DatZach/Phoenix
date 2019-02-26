/// @desc collision_layer_set_active(layerName)
/// Set the active tile collision layer
/// @param layerName string

var layerName = argument0;

global.collisionLayerId = layer_tilemap_get_id(layerName);
layer_set_visible(layerName, false);
