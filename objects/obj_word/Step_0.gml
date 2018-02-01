// See "Platform Basics" tutorial: http://gamemakertutorials.com/?p=383

//React to inputs
//move = 0;
//hsp = move * move_speed;
if (vsp < max_speed) vsp += grav;
if (vsp > max_speed) vsp = max_speed;

//Horizontal Collision
//if (place_meeting(x+hsp,y,obj_wall))
//{
//  while(!place_meeting(x+sign(hsp),y,obj_wall))
//  {
//    x += sign(hsp);
//  }
//  hsp = 0;
//}
//else if (place_meeting(x+hsp,y,obj_word)) {
//	other.hsp = hsp;
//}

// Player collision (get pushed)
//if (place_meeting(x+sign(obj_player.hsp),y,obj_player)) {
//	hsp = obj_player.hsp;
//}


// Word Collision (push words).
//if (moved_this_step) {
//	var word_collision = instance_place(x,y,obj_word);
//	if (word_collision && !word_collision.moved_this_step)
//	{
//	  while(place_meeting(x,y,word_collision))
//	  {
//	      word_collision.x += sign(obj_player.hsp);
//	  }
//		word_collision.moved_this_step = true;
//	}	
//}

 
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
	falling = true;
}
y += vsp;

// Always return hsp to zero at end of step.
// (don't continue moving if not being pushed.)
pushed_this_step = false;