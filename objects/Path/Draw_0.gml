var x0 = 0;
var x1 = 0;
var y0 = 0;
var y1 = 0;

if (MesherUI.menuItemIndex == 7)
{
	if (ds_exists(nodes, ds_type_list) && !ds_list_empty(nodes))
	{
		draw_set_color(
			make_color_rgb(
				irandom_range(0,255), 
				irandom_range(0,255),
				irandom_range(0,255)
		));
	
		for (var i=0;i<ds_list_size(nodes)-1;i++)
		{
			with (nodes[|i])
			{
				x0 = x;
				y0 = y;
			}
		
			with (nodes[|i+1])
			{
				x1 = x;
				y1 = y;
			}
		
			draw_line(x0,y0, x1, y1);
	
		}
	}
}