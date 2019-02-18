/// @desc collision_layer_set_active(targetLayerName)
/// Deactivates all collision layers and activates specified layer
/// @param targetLayerName string

//gml_pragma("global", "global.activeCollisionLayer = \"\"");

//var targetLayerName = argument0;

//if (global.activeCollisionLayer == targetLayerName)
//	return;

//var found = false;
//var layers = layer_get_all();
//for (var i = 0, len = array_length_1d(layers); i < len; ++i) {
//	var layerName = layer_get_name(layers[i]);
	
//	if (layerName == targetLayerName) {
//		instance_activate_layer(layer_get_id(layerName));
//		found = true;
//	}
//	else if (string_ends_with(layerName, "Collision"))
//		instance_deactivate_layer(layer_get_id(layerName));
//}

//if (!found)
//	error(false, "Failed to find collision layer: ", targetLayerName);

//global.activeCollisionLayer = targetLayerName;
