friendlyName = "";
isSelected = false;
connectedNodes = ds_list_create();

initialX = x;
initialY = y;

x0 = -64;
x1 = 64;
y0 = -64;
y1 = 64;

// if any node is under this one, destroy self
with (Node)
{
	if (id != other.id && x==other.x && y==other.y)
	{
		ShowErrorMessage("Cannot place nodes on other nodes");
		instance_destroy();
	}
}

color = make_color_rgb(255,
				irandom_range(100,255),
				irandom_range(25,255))
				

enum Handles 
{
	TopLeft,
	BottomLeft,
	TopRight,
	BottomRight
}
currentHandle = Handles.TopLeft;