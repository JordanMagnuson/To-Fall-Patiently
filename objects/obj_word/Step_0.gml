// See "Platform Basics" tutorial: http://gamemakertutorials.com/?p=383

//React to inputs
//move = 0;
//hsp = move * move_speed;
if (vsp < max_speed) vsp += grav;
if (vsp > max_speed) vsp = max_speed;

//Horizontal Collision
if (place_meeting(x+hsp,y,obj_wall))
{
  while(!place_meeting(x+sign(hsp),y,obj_wall))
  {
    x += sign(hsp);
  }
  hsp = 0;
}
// Player collision (get pushed)
if (place_meeting(x+sign(obj_player.hsp),y,obj_player)) {
	hsp = obj_player.hsp;
}
x += hsp;
 
 
//Vertical Collision
if (collision_point(x,y+vsp,obj_wall,true,false))
{
  while(!collision_point(x,y+sign(vsp),obj_wall,false,false))
  {
    y += sign(vsp);
  }
  vsp = 0;
}
else if (y >= obj_wall.y) {
	image_angle += 1;
}
y += vsp;

// Always return hsp to zero at end of step.
// (don't continue moving if not being pushed.)
hsp = 0;