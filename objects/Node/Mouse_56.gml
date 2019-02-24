if (isSelected && MesherUI.menuItemIndex == 2)
{
	switch (currentHandle)
	{
		case Handles.BottomRight:
			x1 = mouse_x-x;
			y1 = mouse_y-y;
		break;
		case Handles.TopLeft:
			x0 = mouse_x-x;
			y0 = mouse_y-y;
		break;
		case Handles.TopRight:
			x1 = mouse_x-x;
			y0 = mouse_y-y;
		break;
		case Handles.BottomLeft:
			x0 = mouse_x-x;
			y1 = mouse_y-y;
		break;
	}
	
	if (x0 > -32)
	{
		x0 = -32;
	}
	if (y0 > -32)
	{
		y0 = -32;
	}
	
	if (x1 < 32)
	{
		x1 = 32
	}
	
	if (y1 < 32)
	{
		y1 = 32;
	}

}