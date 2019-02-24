

if (isSelected && MesherUI.menuItemIndex == 2)
{
	
	if (mouse_x < x && mouse_y < y)
	{
		currentHandle = Handles.TopLeft;
	}
	else if (mouse_x < x && mouse_y > y)
	{
		currentHandle = Handles.BottomLeft;
	}
	else if (mouse_x > x && mouse_y < y)
	{
		currentHandle = Handles.TopRight;
	}
	else if (mouse_x > x && mouse_y > y)
	{
		currentHandle = Handles.BottomRight;
	}	
	
	switch (currentHandle)
	{
		case Handles.BottomRight:
		case Handles.TopLeft:
			window_set_cursor(cr_size_nwse);
		break;
		case Handles.TopRight:
		case Handles.BottomLeft:
			window_set_cursor(cr_size_nesw);
		break;
	}
}
else 
{
	window_set_cursor(cr_default);
}