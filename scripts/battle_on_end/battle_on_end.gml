var endStatus = argument0;

switch(endStatus) {
	case 0:
		show_message("Defeat!");
		game_end();
		break;
		
	case 1:
		show_message("Victory!");
		game_end();
		break;
		
	case 2:
		show_message("Fled!");
		game_end();
		break;
}