var selectedNode = noone;
with (Node)
{
	if (isSelected) { selectedNode = id;}
}

switch (menuItemIndex)
{
	// add node
	case 0:
		placingNode =true;
	break;
	
	// connect node
	case 1:
	break;
	
	// edit 
	case 2:
	break;
	
	// delete
	case 3:
	break;
	
	// move
	case 4:
		if (selectedNode == noone)
		{
			ShowErrorMessage("No Node Selected");
		}
		else
		{
			with (selectedNode)
			{
				x=mouse_x;
				y=mouse_y;
			}
		}
	break;







}
