// See "Platform Basics" tutorial: http://gamemakertutorials.com/?p=383


//Get the player's input
if (!falling) {
	key_right = keyboard_check(vk_right);
	key_left = -keyboard_check(vk_left);
	key_jump = keyboard_check_pressed(vk_space);

 
	//React to inputs
	move = key_left + key_right;
	hsp = move * move_speed;
} 
else {
	// Gradually reduce hsp when falling off edge (for parabolic fall).
	hsp -= sign(hsp) * 0.05;
	if (abs(hsp) <= 0.05)
		hsp = 0;
}

if (vsp < max_speed) vsp += grav;
if (vsp > max_speed) vsp = max_speed;
 
//if (place_meeting(x,y+1,obj_canyon_top))
//{
//    vsp = key_jump * -jump_speed
//}

// Word Collision
//if (place_meeting(x+hsp,y,obj_word)) {
//	obj_word.hsp = hsp;
//}

// Wall Collision
if (!falling && place_meeting(x+hsp,y,obj_canyon_top))
{
    while(!place_meeting(x+sign(hsp),y,obj_canyon_top))
    {
        x += sign(hsp);
    }
    hsp = 0;
}

// Word Collision (push words).
// @TODO: slow down when pushing words.
if (!falling & place_meeting(x+hsp,y,obj_word)) {
	
	if (!audio_is_playing(pushing_sound)) {
		pushing_sound = audio_play_sound(snd_dragging, 100, true);
	}
	var push_amount = 0;
	var word_collision = instance_place(x+hsp,y,obj_word);
	while(place_meeting(x+hsp,y,word_collision))
	{
		word_collision.x += sign(hsp);
		push_amount += sign(hsp);
	}					
	word_collision.x -= push_amount;
	with (word_collision) scr_push_word(push_amount);
}
else if (audio_is_playing(pushing_sound)) {
	audio_stop_sound(pushing_sound);
}

x += hsp;
 
//Vertical Collision
if (!falling && place_meeting(x,y+vsp,obj_canyon_top))
{
    while(!place_meeting(x,y+sign(vsp),obj_canyon_top))
    {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;

if (!falling && y >= global.canyon_top_y) {
	//move = 0;
	//hsp = 0;
	falling = true;
	global.hum_sound = audio_play_sound(snd_hum, 70, true);
	audio_sound_gain(global.hum_sound, 0, 0);
	audio_sound_gain(global.hum_sound, 1, 5000);	
	audio_sound_gain(global.wind_sound, 0, 20000);
}

if (falling) {
	if (y >= 8000 && !global.wave_music_started) {
		global.wave_music = audio_play_sound(snd_wave_music, 70, true);
		audio_sound_gain(global.wave_music, 0, 0);
		audio_sound_gain(global.wave_music, 1, 5000);
		audio_sound_gain(global.hum_sound, 0, 10000);		
		global.wave_music_started = true;
	}
	if (y >= 12000) {
		instance_change(obj_bird, true);
		with (obj_word)
			instance_destroy();
	}
}