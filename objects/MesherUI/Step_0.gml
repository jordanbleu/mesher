
if (menuItemIndex == 6)
{
	if (keyboard_check(vk_control) && keyboard_check(vk_alt) && keyboard_check_pressed(vk_space))
	{
		var filename = get_open_filename("Nav Mesh|*.navm", "");		
		LoadNavMesh(filename);
	
	}
}