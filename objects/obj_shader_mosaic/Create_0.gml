application_surface_draw_enable(false);
draw_set_color(c_white);

uni_time = shader_get_uniform(shd_mosaic,"time");
var_time_var = 0;

uni_mouse_pos = shader_get_uniform(shd_mosaic,"mouse_pos");
var_mouse_pos_x = mouse_x;
var_mouse_pos_y = mouse_y;

uni_resolution = shader_get_uniform(shd_mosaic,"resolution");
var_resolution_x = room_width;
var_resolution_y = room_height;

uni_pixel_amount = shader_get_uniform(shd_mosaic, "pixel_amount");
var_pixel_amount = 200.0;

shader_enabled = true;
full_screen_effect = true;
