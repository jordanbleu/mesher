
var list = ds_list_create();
var badList = ds_list_create();
var good = true;

// collect every node that is references in connectedNodes
with (Node)
{
	for (var i=0;i<ds_list_size(connectedNodes);i++)
	{
		if (!ds_list_contains(list, connectedNodes[|i]))
		{
			ds_list_add(list, connectedNodes[|i]);
		}
	}
}


with (Node)
{
	if (!ds_list_contains(list, id))
	{
		ds_list_add(badList, id);
	}
}

if (!ds_list_empty(badList))
{
	good = false;
	var str = "The following nodes are not connected:\n";
	for (var i = 0; i< ds_list_size(badList);i++)
	{
		with (badList[|i])
		{
			str += "node" + friendlyName + "\n"
		}	
	}
	show_message(str);
}

ds_list_destroy(list);
ds_list_destroy(badList);
return good;

