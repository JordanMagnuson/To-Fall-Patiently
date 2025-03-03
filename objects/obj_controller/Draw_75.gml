
//draw triangles for mobile controls
//when a control is highlighted draw it brighter

var _w = display_get_gui_width();
var _h = display_get_gui_height();

var _size = .05*_w;

draw_set_color(c_white);

draw_set_alpha(highlight_mobile_left ? .9 : display_mobile_controls_interpolation*.4);

draw_triangle(_w*.1,_h*.5-_size*.6,_w*.1-_size,_h*.5,_w*.1,_h*.5+_size*.6,false);

draw_set_alpha(highlight_mobile_right ? .9 : display_mobile_controls_interpolation*.4);

draw_triangle(_w*.9,_h*.5-_size*.6,_w*.9+_size,_h*.5,_w*.9,_h*.5+_size*.6,false);

draw_set_alpha(1);