/// @func FindNodeGridIndexByNode(grid, nodeToFind)
/// @desc searches for your node in the table and returns its index / row number
/// @arg {ds_grid} grid
/// @arg {NavMeshNode} nodeToFind

var grid = argument0;
var node = argument1;

for (var i=0; i<ds_grid_height(grid);i++)
{
	if (ds_grid_get(grid, NodeGrid.Vertex, i) == node)
	{
		return i;
	}
}

// something is not right if we get here
ShowErrorMessage("Could not trace path to that node.");
//show_error ("Node " + string(node) + " is referenced but it doesn't exist" ,true);