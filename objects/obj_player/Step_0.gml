// See "Platform Basics" tutorial: http://gamemakertutorials.com/?p=383


//Get the player's input
key_right = keyboard_check(vk_right);
key_left = -keyboard_check(vk_left);
key_jump = keyboard_check_pressed(vk_space);
 
//React to inputs
move = key_left + key_right;
hsp = move * move_speed;
if (vsp < max_speed) vsp += grav;
if (vsp > max_speed) vsp = max_speed;
 
if (place_meeting(x,y+1,obj_wall))
{
    vsp = key_jump * -jump_speed
}

// Word Collision
//if (place_meeting(x+hsp,y,obj_word)) {
//	obj_word.hsp = hsp;
//}

// Wall Collision
if (place_meeting(x+hsp,y,obj_wall))
{
    while(!place_meeting(x+sign(hsp),y,obj_wall))
    {
        x += sign(hsp);
    }
    hsp = 0;
}

// Word Collision (push words).
if (!falling & place_meeting(x+hsp,y,obj_word))
{
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

x += hsp;
 
//Vertical Collision
if (place_meeting(x,y+vsp,obj_wall))
{
    while(!place_meeting(x,y+sign(vsp),obj_wall))
    {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;

if (y >= obj_wall.y)
	falling = true;