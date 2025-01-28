// Update camera bounds.
left = x - view_wport[0]/2;
top = y - view_hport[0]/2;
right = x + view_wport[0]/2; 
bot = y + view_hport[0]/2;

// Follow the follow object.
if (follow != noone) {
	x_to = follow.x;
	y_to = follow.y;
}

// Move towards x_to, with easing.
x_mov = (x_to - x) / 10;
y_mov = (y_to - y) / 10;
if (abs(x_mov) < 0.5) {
	x = x_to;
}
else {
	x += x_mov;
}
if (abs(y_mov) < 0.5) {
	y = y_to;
}
else {
	y += y_mov;
}

// Clamp to room bounds.
if (x < view_wport[0] / 2) {
	x = view_wport[0] / 2;
}
else if (x > room_width - view_wport[0] / 2) {
	x = room_width - view_wport[0] / 2;
}
if (y < view_hport[0] / 2) {
	y = view_hport[0] / 2;	
}
else if (y > room_height - view_hport[0] / 2) {
	y = room_height - view_hport[0] / 2;
}

// When the bird comes in, clamp to view width.
if (instance_exists(obj_bird)) {
	if (x > view_wport[0] / 2) {
		x = view_wport[0] / 2;
	}	
}


// Update the camera with new x, y.
var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);