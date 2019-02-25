
draw_set_alpha(0.35);
draw_set_color(color);
draw_rectangle(x+x0, y+y0, x+x1, y+y1, false);

draw_set_alpha(1);

if (isSelected)
{
	draw_set_color(c_white);
	draw_text (x+x0, y+y0, string(x0) + "," + string(y0));
	draw_text (x+x1, y+y1, string(x1) + "," + string(y1));
	image_blend = global.pink;
}
else
{
	image_blend = c_white;
}

draw_self();
draw_set_halign(fa_center);

draw_set_color(color);
draw_text (x,y-16,friendlyName);
draw_set_halign(fa_left);

var connectedNodesCount = ds_list_size(connectedNodes);
if ((isSelected || MesherUI.enableAllConnections))
{
	if (MesherUI.menuItemIndex == 7)
	{
		draw_set_alpha(0.5);
	}
	else
	{
		draw_set_alpha(1);
	}
	
	if (ds_exists(connectedNodes, ds_type_list))
	{
		for (var i=0;i<connectedNodesCount;i++)
		{
			draw_set_color(color);

			with (connectedNodes[|i])
			{
				draw_line(other.x + (i*2), other.y, x-16+(i*2),y-16);
				draw_circle(x-16,y-16,3,true);
			}

		}
	}
}

if (isSelected && MesherUI.menuItemIndex == 2)
{
	if (currentHandle == Handles.TopLeft)
	{
		draw_sprite(sprDragHandle, 0, x+x0, y+y0);
	}
	else if (currentHandle == Handles.BottomLeft)
	{
		draw_sprite(sprDragHandle, 1, x+x0, y+y1);
	}
	else if (currentHandle == Handles.TopRight)
	{
		draw_sprite(sprDragHandle, 2, x+x1, y+y0);
	}
	else if (currentHandle == Handles.BottomRight)
	{
		draw_sprite(sprDragHandle, 3, x+x1, y+y1);
	}
}

draw_set_alpha(1);
if (MesherUI.menuItemIndex == 1)
{
	draw_text (x+x0, y+y0+12, "CN#:" + string (ds_list_size(connectedNodes)));
}