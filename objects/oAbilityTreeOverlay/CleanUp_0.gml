if (surface_exists(surface)) {
	surface_free(surface);
	surface = noone;
}

if (nodes != noone) {
	ds_list_destroy(nodes);
	nodes = noone;
}

if (connections != noone) {
	ds_list_destroy(connections);
	connections = noone;
}
