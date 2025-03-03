if (x < -sprite_width/2 || x > view_wport[0] + sprite_width/2)
	offscreen = true;

if (y < 15000) {
	y += obj_player.max_speed;
}

if (!offscreen) { // y > 14000
	if (keyboard_check(vk_left) || obj_controller.left_screen_held) {
		x -= 2;
		if (image_angle > -90)
			image_angle -= 1;
		if (!started_flying) {
			//image_speed = 5;
			started_flying = true;
		}
	}
	else if (keyboard_check(vk_right) || obj_controller.right_screen_held) {
		x += 2;
		if (image_angle < 90) 
			image_angle += 1;
		if (!started_flying) {
			//image_speed = 5;
			started_flying = true;		
		}
	}
}

if (offscreen && !instance_exists(obj_fade_out_game)) {
	instance_create_layer(0, 0, "lyr_fade", obj_fade_out_game);
}

//if (image_index == 0)
//	audio_play_sound(snd_wing_flap, 10, false);