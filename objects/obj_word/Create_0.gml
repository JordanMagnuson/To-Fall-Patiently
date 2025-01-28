///Initialize Variables
grav = 0.05;
max_speed = 2;
hsp = 0;
vsp = 0;
move_speed = 4;
falling = false;
//image_angle = 45;
image_blend = c_black;

// Set origin to bottom left (instead of default top left).
sprite_set_offset(sprite_index,sprite_width/2,sprite_height);