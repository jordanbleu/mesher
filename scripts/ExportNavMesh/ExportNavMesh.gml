var fileName = argument0;
VerifyConnections();

var file = file_text_open_write(fileName);

// write out some meta data
file_text_write_string(file, "#region Generate NavMesh\n");
file_text_write_string(file, "// ** Code Generated Using Mesher 0.0.0.1 **\n");
file_text_write_string(file, "// Instantiate nodes and keep their reference for later\n");
with (Node)
{
	file_text_write_string(file, "var node" + friendlyName+ " = instance_create_depth(" + string(x) + "," + string(y) + ",0,NavMeshNode);\n");
}

file_text_write_string(file, "// Initialize and connect the nav mesh\n");
with (Node)
{
	var ref = "node" + friendlyName;
	file_text_write_string(file, "with (" + ref + ") \n{ \n");	
	file_text_write_string(file, "\tx0=" + string(x+x0) + ";\n");			
	file_text_write_string(file, "\tx1=" + string(x+x1) + ";\n");			
	file_text_write_string(file, "\ty0=" + string(y+y0) + ";\n");			
	file_text_write_string(file, "\ty1=" + string(y+y1) + ";\n");			
	file_text_write_string(file, "\tfriendlyName=\"" + friendlyName + "\";\n");			
	file_text_write_string(file, "\tconnectedNodes = [\n");			
	
	var connectedNodesString = "";
	for (var i=0; i<ds_list_size(connectedNodes);i++)
	{
		var generatedNodeRef = "node";
		with (connectedNodes[|i])
		{
			generatedNodeRef += friendlyName;
		}
		
		connectedNodesString+="\t\t" +generatedNodeRef;
		
		if (i < ds_list_size(connectedNodes))
		{
			connectedNodesString += ", ";
		}
		connectedNodesString += "\n";
	}	
	file_text_write_string(file, connectedNodesString);
	file_text_write_string(file, "\t];\n");			
	file_text_write_string(file, "}\n");	
}
file_text_write_string(file, "#endregion\n");


file_text_close(file);