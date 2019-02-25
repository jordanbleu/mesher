var index = MesherUI.menuItemIndex;
var selectedNode = noone;
with (Node)
{
	if (isSelected) { selectedNode = id;}
}

switch (index)
{
	case 1:
		if (isSelected)
		{
			ShowErrorMessage("Cannot connect node to itself");
		}
		else if (selectedNode == noone)
		{
			ShowErrorMessage("Use right click to select a node to connect");
		}
		else
		{
			var me = id;
			
			with (selectedNode)
			{
				if (ds_list_contains(connectedNodes, me))
				{
					// remove the connection here
					var index = ds_list_find_index(connectedNodes, me);
					if (index != -1)
					{
						ds_list_delete(connectedNodes, index);
					}					
				}
				else
				{
					ds_list_add(connectedNodes, me);
				}			
			}
		}
	break;
	
	
	case 3:
		if (isSelected)
		{
			instance_destroy();
		}
		else
		{
			ShowErrorMessage("Select this node and click to delete");
		}
	break;
	
	case 7:
		if (isSelected)
		{
			ShowErrorMessage("Cannot create path to / from the same node");
		}
		if (selectedNode == noone)
		{
			ShowErrorMessage("Use right click to select a starting node");
		}
		else
		{
			var myId = id;
			with (Path)
			{
				requestedStartNode = selectedNode;
				requestedEndNode = myId;
				updatePath = true;
			}
		}		
	break;

}
