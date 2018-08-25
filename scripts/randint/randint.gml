gml_pragma("forceinline");
if (argument_count == 0)
	return irandom($FFFFFFFF);
else if (argument_count == 1)
	return irandom($FFFFFFFF - floor(argument[0])) + floor(argument[0]);
else
	return irandom_range(floor(argument[0]), floor(argument[1]));