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
 
//Horizontal Collision
if (place_meeting(x+hsp,y,obj_wall))
{
    while(!place_meeting(x+sign(hsp),y,obj_wall))
    {
        x += sign(hsp);
    }
    hsp = 0;
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