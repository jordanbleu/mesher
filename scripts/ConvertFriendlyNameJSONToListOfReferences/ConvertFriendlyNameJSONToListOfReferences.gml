
var connectedNodes = argument0;
var json = argument1;

var friendlyNameList = ds_list_create();
ds_list_read(friendlyNameList, string(json));

if (ds_exists(friendlyNameList, ds_type_list))
{
	for (var i=0;i<ds_list_size(friendlyNameList);i++)
	{
		var fName = friendlyNameList[|i];
		ds_list_add(connectedNodes, GetNodeReferenceByFriendlyName(fName));
	}
	ds_list_destroy(friendlyNameList);
}

