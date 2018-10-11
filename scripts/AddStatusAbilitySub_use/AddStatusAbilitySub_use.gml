/// @func MoveAbilitySub_use(ability, sub, source, target);
/// @context mBattle
/// @param ability Ability
/// @param sub MoveAbilitySub
/// @param source Monster
/// @param target Monster

var ability = argument0;
var sub = argument1;
var source = argument2;
var target = argument3;

var statusEffect = status_effect_create_from_sub(sub);
var indType = IndType.Bleed + sub[@ AddStatusAbilitySub.StatusEffect];

// TODO Allow redirecting status effect targets in DB
if (statusEffect[@ StatusEffect.Type] == STATUS_EFFECT_BUFF)
	target = source;

var isHit = randchance(sub[@ AddStatusAbilitySub.Accuracy] - status_effect_get_resistence(statusEffect, target));
if (isHit) {
    var existingEffect = mon_find_status_effect(target, statusEffect[@ StatusEffect.Type]);
    if (existingEffect != noone)
        existingEffect[@ StatusEffect.Turns] += statusEffect[@ StatusEffect.Turns];
    else {
        var statusEffects = target[@ k_mon.status_effects];
        ds_list_add(statusEffects, statusEffect);
    }
            
    fx_toast_status(target, indType);
}
else
    fx_toast_status(target, indType | IndType.Resist);

return true;
