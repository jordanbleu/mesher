
VerifyConnections();

var filename = argument0;

file_delete(filename);
ini_open(filename);


with (Node)
{
	ini_write_real(friendlyName, "x", x);
	ini_write_real(friendlyName, "y", y);
	ini_write_real(friendlyName, "x0", x0);
	ini_write_real(friendlyName, "x1", x1);
	ini_write_real(friendlyName, "y0", y0);
	ini_write_real(friendlyName, "y1", y1);
	ini_write_real(friendlyName, "color", color);
	
	var list = ds_list_create();
	ExtractConnectedNodesFriendlyNames(list,connectedNodes);
	ini_write_string(friendlyName, "connectedNodes", ds_list_write(list));
	ds_list_destroy(list);
}

ini_close();

ShowErrorMessage("File '" + filename + "' saved!")
