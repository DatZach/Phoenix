if (input_check_pressed(global.k_action)) {
	inventory_add_item(oPlayer.inventory, "Flower");
	instance_destroy();
}
