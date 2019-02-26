/// @function mon_set_seed(monster, class, seed);
/// Sets the seed of a Monster and updates all relevant properties
/// @prop monster Monster
/// @prop class real
/// @prop seed real

var mon = argument0;
var class = argument1;
var seed = argument2;

mon[@ k_mon.class] = class; // TODO Set class in another function...
mon[@ k_mon.seed] = seed;

var dbMonster = global.dbMonsters[| class];
var dbBaseStats = dbMonster[@ k_db_mon.stats];

// TODO Vary base stats given seed
var baseStats = mon[@ k_mon.base_stats];
baseStats[@ k_stats.hp] = dbBaseStats[k_stats.hp];
baseStats[@ k_stats.strength] = dbBaseStats[k_stats.strength];
baseStats[@ k_stats.protection] = dbBaseStats[k_stats.protection];
baseStats[@ k_stats.speed] = dbBaseStats[k_stats.speed];
baseStats[@ k_stats.accuracy] = dbBaseStats[k_stats.accuracy];
baseStats[@ k_stats.critical] = dbBaseStats[k_stats.critical];
baseStats[@ k_stats.dodge] = dbBaseStats[k_stats.dodge];
baseStats[@ k_stats.bleed_resist] = dbBaseStats[k_stats.bleed_resist];
baseStats[@ k_stats.poison_resist] = dbBaseStats[k_stats.poison_resist];
baseStats[@ k_stats.stun_resist] = dbBaseStats[k_stats.stun_resist];
baseStats[@ k_stats.move_resist] = dbBaseStats[k_stats.move_resist];
baseStats[@ k_stats.death_blow_resist] = dbBaseStats[k_stats.death_blow_resist];
