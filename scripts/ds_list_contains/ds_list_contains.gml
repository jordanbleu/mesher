/// @func ds_list_contains(id, value)
/// @desc returns true if the list contains an element
/// @arg id
/// @arg value

var list = argument0;
var value = argument1;
var index = ds_list_find_index(list, value);
return index != -1;