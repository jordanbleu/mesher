// returns a list of friendlyNames

var list = argument0;
var connectedNodes = argument1;

for (var i=0; i<ds_list_size(connectedNodes);i++)
{
	var fName = "";
	
	with (connectedNodes[|i])
	{
		fName = friendlyName;	
	}	
	
	ds_list_add(list, string(fName));
}


