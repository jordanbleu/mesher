



switch (menuItemIndex)
{
	// add node
	case 0:
		placingNode = false;
		var node = instance_create_depth(mouse_x-(mouse_x mod 16), mouse_y - (mouse_y mod 16), 0, Node);
		ReNumberNodes();
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
		var selectedNode = noone;
		with (Node)
		{
			if (isSelected) { selectedNode = id;}
		}
		
		with (selectedNode)
		{
			x=mouse_x - mouse_x mod 16;
			y=mouse_y - mouse_y mod 16;
			
			with (Node)
			{
				if (id != other.id && x==other.x && y==other.y)
				{
					ShowErrorMessage("Cannot place nodes on other nodes");
					other.x = other.initialX;
					other.y = other.initialY;
				}	
			}
			initialX = x;
			initialY = y;
		}

	break;






}


