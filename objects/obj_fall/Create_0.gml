///Initialize Variables
grav = 0.05;
max_speed = 3;
hsp = 0;
vsp = 0;
move_speed = 4;
falling = false;
//image_angle = 45;
image_blend = c_black;

// Set origin to bottom left (instead of default top left).
sprite_set_offset(sprite_index,0,sprite_height);

image_angle = 45;