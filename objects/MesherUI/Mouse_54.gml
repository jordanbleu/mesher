if (menuItemIndex == 5)
{
	var name = get_save_filename("Text|*.txt", "output.txt");
	
	if (name != "")
	{
		ExportNavMesh(name);
	}
}