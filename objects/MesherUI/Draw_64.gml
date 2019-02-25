var w =display_get_gui_width();
var h = display_get_gui_height();


draw_set_alpha(0.95);
draw_set_color(global.darkGrey);
draw_rectangle (0,0,w,16,false);

draw_set_alpha(1);
draw_set_color(global.lightGrey);
draw_set_halign(fa_left);
draw_text (0,0,room_get_name(room));


var leftSide = w/4;
var margins = 20;
for (var i=0; i<array_length_1d(menuItems);i++)
{
	strWidth = string_width(menuItems[i]);
	
	if (i==menuItemIndex)
	{
		draw_set_color(global.pink);
	}
	else
	{
		draw_set_color(global.lightGrey);
	}
	draw_rectangle(leftSide-(margins/2), 0, leftSide+strWidth+(margins/2), 16, false);
	draw_set_color(global.darkGrey);
	draw_text (leftSide, 0, menuItems[i]);
	
	leftSide += strWidth + margins;
}

if (menuItemIndex == 5)
{
	draw_set_color(global.darkGrey);
	draw_rectangle(0,16,w, 32,false);
	draw_set_color(global.pink);
	draw_text(0,16,"Left Click to save, Right Click to Export");
}
else if (menuItemIndex == 6)
{
	draw_set_color(global.darkGrey);
	draw_rectangle(0,16,w, 32,false);
	draw_set_color(global.pink);
	draw_text(0,16,"Press Ctrl+Alt+Space to load the previous mesh");
}
else if (menuItemIndex == 1)
{
	draw_set_color(global.darkGrey);
	draw_rectangle(0,16,w, 32,false);
	draw_set_color(global.pink);
	draw_text(0,16,"Press C enable / disable viewing all connections");
}
else if (menuItemIndex == 7)
{
	draw_set_color(global.darkGrey);
	draw_rectangle(0,16,w, 32,false);
	draw_set_color(global.pink);
	draw_text(0,16,"Select a node and left click another to view the path");
}
