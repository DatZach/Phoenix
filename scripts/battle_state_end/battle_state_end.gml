switch(endStatus) {
	case 0:
		show_message("Defeat!");
		break;
		
	case 1:
		show_message("Victory!");
		break;
		
	case 2:
		show_message("Fled!");
		break;
}

//instance_destroy();
game_end();