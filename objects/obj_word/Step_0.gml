//React to inputs
//move = 0;
//hsp = move * move_speed;
if (vsp < max_speed) vsp += grav;
if (vsp > max_speed) vsp = max_speed;

// Player collision (get pushed)
if (place_meeting(x+sign(obj_player.hsp),y,obj_player)) {
	hsp = obj_player.hsp;
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
//if (collision_point(x,y+vsp,obj_wall,false,false))
//{
//    while(!collision_point(x,y+sign(vsp),obj_wall,false,false))
//    {
//        y += sign(vsp);
//    }
//    vsp = 0;
//}
if (place_meeting(x,y+vsp,obj_wall))
{
    while(!place_meeting(x,y+sign(vsp),obj_wall))
    {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;

// Always return hsp to zero at end of step.
// (don't continue moving if not being pushed.)
hsp = 0;