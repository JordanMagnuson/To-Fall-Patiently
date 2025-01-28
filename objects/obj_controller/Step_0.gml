// Parallax scrolling for background.
if (obj_player.falling) {
	layer_vspeed(canyon_background, obj_player.vsp / 2);
}

// Add the poem end words once the player starts falling.
if (obj_player.falling && !end_words_added) {
	if (point_in_rectangle(obj_patiently.x, obj_patiently.y, obj_camera.left, obj_camera.top, obj_camera.right, obj_camera.bot)) {		
		// word: to
		var myx = obj_player.x + choose(-1, 1) * random(10);
		var myy = obj_camera.bot + view_hport[0];
		var next_word = instance_create_layer(myx, myy, "lyr_words", obj_to);
		show_debug_message("myy:" + string(myy));
		with (next_word) 
			vsp = obj_patiently.vsp;
			
		// word: trust
		myx = obj_player.x + choose(-1, 1) * random(10);
		myy += view_hport[0] + choose(-1, 1) * random(view_hport[0]/4);
		show_debug_message("myy:" + string(myy));		
		next_word = instance_create_layer(myx, myy, "lyr_words", obj_trust);
		with (next_word) 
			vsp = obj_patiently.vsp;		
			
		// word: our
		myx = obj_player.x + choose(-1, 1) * random(10);
		myy += view_hport[0] + choose(-1, 1) * random(view_hport[0]/4);
		show_debug_message("myy:" + string(myy));		
		next_word = instance_create_layer(myx, myy, "lyr_words", obj_our);
		with (next_word) 
			vsp = obj_patiently.vsp;			
			
		// word: heaviness
		myx = obj_player.x + choose(-1, 1) * random(10);
		myy += view_hport[0] + choose(-1, 1) * random(view_hport[0]/4);
		show_debug_message("myy:" + string(myy));		
		next_word = instance_create_layer(myx, myy, "lyr_words", obj_heaviness);
		with (next_word) 
			vsp = obj_patiently.vsp;							
			
		end_words_added = true;
	}
}