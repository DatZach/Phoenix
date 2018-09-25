/// @func ability_tree_nearest_node(source, property, direction)
/// Determines nearest node to source node in given direction in relation to property
/// @context oOverlayAbilityTree
/// @param source AbilityNode
/// @param property AbilityNode.X | AbilityNode.Y
/// @param direction real 1 | -1

var source = argument0;
var property = argument1;
var dir = argument2;

var candidate = noone;
var candidateScore = $7fffffff;
	
for (var i = 0, isize = ds_list_size(nodes); i < isize; ++i) {
	var node = nodes[| i];
	if (node == selectedNode)
		continue;
		
	if (sign(node[@ property] - selectedNode[@ property]) != dir)
		continue;
		
	var nodeScore = point_distance(
		selectedNode[@ 1], selectedNode[@ 2],
		node[@ 1], node[@ 2]
	);
		
	if (nodeScore < candidateScore) {
		candidateScore = nodeScore;
		candidate = node;
	}
}
	
return candidate;
