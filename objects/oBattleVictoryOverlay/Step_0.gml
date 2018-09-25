/// @desc Input

if (input_check_pressed(global.k_action)) {
	switch(phase) {
		case 0: // Roll call awards
			break;
			
		case 1: { // Complete
			// Show Ability Tree Overlay if we leveled up
			var ranks = mBattle.field[@ FIELD_ALLY];
			var size = 0;
			for (var i = 0; i < FIELD_RANKS; ++i) {
				var rank = ranks[@ i];
				if (rank == noone)
					continue;
					
				var totalExperience = rank[@ k_mon.experience];
				var awardList = mBattle.awards[? rank];
				if (!is_undefined(awardList)) {
					for (var j = 0, jsize = ds_list_size(awardList); j < jsize; ++j) {
						var award = awardList[| j];
						var experience = battle_award_get_experience(award);
						totalExperience += experience;
					}
				}
				
				var expHigh = mon_get_level_experience(rank, rank[@ k_mon.level] + 1);
				if (expHigh > totalExperience) {
					var inst = instance_create_layer(0, 0, LAYER_INSTANCES, oAbilityTreeOverlay);
					inst.monster = rank;
					with(inst) event_user(EV_INITIALIZE);
				}
			}
			
			// Distribute experience
			with (mBattle)
				battle_awards_distribute_experience();
		
			phase = 2;
			break;
		}
		
		case 2: // Waiting for Ability Tree Overlay to close
			// Do nothing
			break;
	}
}

if (phase == 2 && !instance_exists(oAbilityTreeOverlay))
	instance_destroy();
