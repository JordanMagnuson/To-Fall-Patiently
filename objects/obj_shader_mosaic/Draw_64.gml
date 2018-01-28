var_time_var+=0.04;

var_mouse_pos_x = mouse_x;
var_mouse_pos_y = mouse_y;

shader_set(shd_mosaic);
    shader_set_uniform_f(uni_time, var_time_var);
    shader_set_uniform_f(uni_mouse_pos, var_mouse_pos_x, var_mouse_pos_y);
    shader_set_uniform_f(uni_resolution, var_resolution_x, var_resolution_y);
    shader_set_uniform_f(uni_pixel_amount, var_pixel_amount);
    //draw_surface(application_surface,0,0);
		draw_surface_stretched(application_surface, 0, 0, window_get_width(), window_get_height());
shader_reset();


