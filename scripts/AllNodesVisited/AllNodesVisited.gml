/// @func AllNodesVisited(id)
/// @desc returns true if all nodes in the grid are marked as visited
/// @arg grid

var grid = argument0;

for (var i=0;i<ds_grid_height(grid);i++)
{
	if (ds_grid_get(grid, NodeGrid.Visited, i) == false)
	{
		return false;
	}
}
return true;