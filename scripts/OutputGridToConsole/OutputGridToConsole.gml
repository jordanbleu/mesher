/// @func OutputGridToConsole(grid)
/// @desc outputs the grid to the debug console formatted very poorly
/// @arg grid

var grid = argument0;

for (var h=0;h<ds_grid_height(grid);h++)
{
	var str = "\n";
	for (var w=0;w<ds_grid_width(grid);w++)
	{
		str+=" | " + string(ds_grid_get(grid, w, h));		
	}
	show_debug_message(str);
}

