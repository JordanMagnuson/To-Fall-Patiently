obj_camera.follow = id;
started_flying = false;
fading_out = false;
offscreen = false;

obj_player.falling = false;
canyon_background = layer_get_id("bg_canyon_background");
layer_vspeed(canyon_background, 0);