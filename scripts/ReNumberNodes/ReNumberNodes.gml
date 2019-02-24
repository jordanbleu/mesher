var num =instance_number(Node);

with (Node)
{
	friendlyName = string(--num);	
	
	// if any of my nodes don't exist, update the list

	if (ds_exists(connectedNodes, ds_type_list))
	{
		for (var i=0;i<ds_list_size(connectedNodes);i++)
		{
			var inst = connectedNodes[|i];
		
			if (!instance_exists(inst))
			{
				var index = ds_list_find_index(connectedNodes, inst);
				ds_list_delete(connectedNodes, index);
			}
		}	
	}
} 