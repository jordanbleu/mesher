var filename = argument0;

ini_open(filename);

var found = true;
var fName = 0;
var friendlyNameConnectionMap = ds_map_create();	

with (Node)
{
	instance_destroy();
}

while (true) 
{
	var name = string(fName);
	if (!ini_section_exists(name))
	{
		break;	
	}
	
	var node = instance_create_depth(0,0,0,Node);
		
	// instance level
	with (node)
	{
		self.friendlyName = name;
		self.skipReNumber = true;
		self.x = ini_read_real(name, "x", 0);
		self.y = ini_read_real(name, "y", 0);
		self.x0 = ini_read_real(name, "x0", 0);
		self.y0 = ini_read_real(name, "y0", 0);
		self.x1 = ini_read_real(name, "x1", 0);
		self.y1 = ini_read_real(name, "y1", 0);
		self.color = ini_read_real(name, "color",make_color_rgb(
			255,
			irandom_range(100,255),
			irandom_range(25,255)));		
		ds_map_add(friendlyNameConnectionMap, name, ini_read_string(name, "connectedNodes", ""));
	}
	fName++;
	
}

// create a map of friendlyName to reference
// this is to avoid nested With statements because they bad
var friendlyNameMap = ds_map_create();
var friendlyNameList = ds_list_create();
with(Node)
{
	ds_map_add(friendlyNameMap, friendlyName, id);
	ds_list_add(friendlyNameList, friendlyName);
}

for (var i=0;i<ds_list_size(friendlyNameList);i++)
{
	var connNodes = ds_list_create();
	ConvertFriendlyNameJSONToListOfReferences(connNodes, friendlyNameConnectionMap[?friendlyNameList[|i]]);
	with (friendlyNameMap[?friendlyNameList[|i]])
	{	
		ds_list_copy(connectedNodes, connNodes);
	}	
	ds_list_destroy(connNodes);
}

ini_close();
ds_list_destroy(friendlyNameList);
ds_map_destroy(friendlyNameConnectionMap);
ds_map_destroy(friendlyNameMap);