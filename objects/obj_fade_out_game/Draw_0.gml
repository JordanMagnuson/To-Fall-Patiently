//cam_x1 = camera_get_view_x(view_camera[0]);
//cam_y1 = camera_get_view_y(view_camera[0]) - 10; // Start a bit above camera position, in case of movement, etc.
//cam_x2 = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]);
//cam_y2 = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]);

draw_set_color(c_white);
draw_set_alpha(alpha);
draw_rectangle(obj_camera.left, obj_camera.top, obj_camera.right, obj_camera.bot, false);
draw_set_alpha(1);
draw_set_color(c_white);
