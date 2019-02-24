


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

}