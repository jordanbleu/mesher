if (msgTime > 0)
{
	draw_set_color(global.darkGrey);
	draw_rectangle(mouse_x, mouse_y, mouse_x+string_width(msg), mouse_y+16, false);
	draw_set_color(global.lightGrey);
	draw_text (mouse_x, mouse_y, msg);
}