/// @func MapRoute(stack, startNode, endNode)
/// @desc Populates a ds_stack with the nodes to follow the shortest path in order
/// @arg {ds_stack} stack
/// @arg {Node} startNode
/// @arg {Node} endNode

#macro INFINITE 2147483646 

enum NodeGrid 
{
	Vertex,
	Distance,
	Previous,
	Visited,
	MyFriendlyName, 
	PrevFriendlyName 
}

// grab our args
var path = argument0;
var sourceNode = argument1;
var targetNode = argument2;

if (VerifyConnections())
{
	if (sourceNode == noone)
	{
		show_error("Source Node does not exist", true);
	}
	else if (targetNode == noone)
	{
		show_error("Target Node does not exist", true);
	}

	// Store every node we need to visit
	var grid = ds_grid_create(6, instance_number(Node));
	var row =0;

	with (Node)
	{
		ds_grid_add(grid, NodeGrid.Vertex, row, id);
		ds_grid_add(grid, NodeGrid.Distance, row, (id==sourceNode ? 0 : INFINITE));
		ds_grid_add(grid, NodeGrid.Previous, row, noone);
		ds_grid_add(grid, NodeGrid.Visited, row, false);
		ds_grid_add(grid, NodeGrid.MyFriendlyName, row, friendlyName);
		ds_grid_add(grid, NodeGrid.PrevFriendlyName, row, "noone");
	
		row++;
	}

	var visitedNeighbors = ds_list_create();


	while (!AllNodesVisited(grid))
	{
		// find the node with the smallest known distance and mark it as visited
		var nodeIndex = VisitNextNode(grid);
		var node = ds_grid_get(grid, NodeGrid.Vertex, nodeIndex);
	
		var nodeDistance = ds_grid_get(grid, NodeGrid.Distance, nodeIndex);
	
		// extract its connectedNodes, aka its neighboring nodes
		var neighbors;
		var nodeFriendlyName;
		with (node)
		{
			nodeFriendlyName = friendlyName;
			neighbors = connectedNodes;
		}
	
		// for each of my neighbor nodes
		var bigPenis = array_length_1d(neighbors);
		for (var i=0;i<ds_list_size(neighbors);i++)
		{
			var neighborIndex = FindNodeGridIndexByNode(grid, neighbors[|i]);
		
			// if the node is not yet visited
			if (!ds_grid_get(grid, NodeGrid.Visited, neighborIndex))
			{
				// grab the reference to this node
				var neighborNode = ds_grid_get(grid, NodeGrid.Vertex, neighborIndex);
			
				// add to our list so we can validate later
				if (!ds_list_contains(visitedNeighbors, neighborNode))
				{
					ds_list_add(visitedNeighbors, neighborNode);
				}
			
				// grab its current distance from the table
				var knownDistanceOfNeighbor = ds_grid_get(grid, NodeGrid.Distance, neighborIndex);			
			
				// calculate the distance between our <node> and our <neighborNode>.  Add the current node 
				// cost to that too.
				var nodeX, nodeY, neighborX, neighborY;
				with (node) {nodeX=x;nodeY=y;}
				with (neighborNode){neighborX=x;neighborY=y;}
				var newDistance = abs(point_distance(nodeX, nodeY, neighborX, neighborY)) + nodeDistance;
			
				// we found a new shortest path!
				if (newDistance < knownDistanceOfNeighbor)
				{
					ds_grid_set(grid, NodeGrid.Distance, neighborIndex, newDistance);
					ds_grid_set(grid, NodeGrid.Previous, neighborIndex, node);
					ds_grid_set(grid, NodeGrid.PrevFriendlyName, neighborIndex, nodeFriendlyName);
				}
			}
		}
	}

	// ---- uncomment this to see the actual output data, which is pretty dope. ---- \\
	show_debug_message(" | Node | Dist | Prev | 1 | Me | Prev");
	OutputGridToConsole(grid);

	// now that we have finished calculating all our shortest paths, use 
	// reverse iteration to map our our path from destination > start

	var thisNode = targetNode;
	var found = false;
	var cnt=0;

	show_debug_message("Mapped Route!");
	while (!found)  
	{
		var name = "";
		with (thisNode) { name = friendlyName;}

		if (thisNode == sourceNode)
		{
			found =true;
		}
	
		ds_stack_push(path, thisNode);
		var thisNodeIndex = FindNodeGridIndexByNode(grid, thisNode);
		var prevNode = ds_grid_get(grid, NodeGrid.Previous, thisNodeIndex);
	
		thisNode = prevNode
	
		cnt++;
	} 
}
