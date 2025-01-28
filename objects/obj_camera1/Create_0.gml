// For camera tutorial, see https://www.youtube.com/watch?v=Pd54vNc2N4E

// Set up the camera.
camera = camera_create();
var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(480, 270, 1, 10000);
camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);
view_camera[0] = camera;

// Define camera view bounds (for convinience)
left = x - view_wport[0]/2;
top = y - view_hport[0]/2;
right = x + view_wport[0]/2; 
bot = y + view_hport[0]/2;

// Follow the player.
follow = obj_player;
x = follow.x;
y = follow.y;

// Easing variables.
x_to = x;
y_to = y;