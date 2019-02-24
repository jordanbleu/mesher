// save
if (menuItemIndex == 5)
{
	var name = get_save_filename("Nav Mesh|*.navm", "saved_nav_mesh.navm");
	
	if (name != "")
	{
		SaveNavMesh(name);
	}
}

