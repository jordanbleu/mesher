global.pink = make_color_rgb(248,24,101);
global.darkGrey = make_color_rgb(23,23,23);
global.white = make_color_rgb(255,255,255);
global.lightGrey = make_color_rgb(153,153,153);

var w = display_get_gui_width();
instance_create_depth(0,0,0,MesherUI);
instance_create_depth(mouse_x, mouse_y, 0, mouse);


global.displayWidth = 640;
global.displayHeight = 360;


surface_resize(application_surface,global.displayWidth , global.displayHeight);
window_set_size(global.displayWidth*2, global.displayHeight*2);
display_set_gui_size(global.displayWidth , global.displayHeight);


global.ui_menuBgColor =  make_color_rgb(0,0,0);       // bg color of the menu
global.ui_menuFgColor =  make_color_rgb(245,245,245); // text color of the menu
global.ui_titleBgColor = make_color_rgb(245,245,245); // background color of the title
global.ui_titleFgColor = make_color_rgb(0,0,0);       // text color of the title bar
global.ui_accentColor = make_color_rgb(0,0,255);

gpu_set_texfilter(false);

view_enabled = true;
view_set_visible(0, true);
view_camera[0] = camera_create_view(mouse_x,mouse_y, global.displayWidth, global.displayHeight, 0, mouse, 6, 6, global.displayWidth/4, global.displayHeight/4);
