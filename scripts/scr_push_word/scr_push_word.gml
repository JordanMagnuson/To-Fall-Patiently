/// @function scr_push_word(push_amount)
function scr_push_word(argument0) {
	{
		var push_amount = argument0;

		// Recursively push any words that we run into while being pushed.
		if (!falling && place_meeting(x+push_amount,y,obj_word))
		{
			var word_collision = instance_place(x+push_amount,y,obj_word);
			with (word_collision) scr_push_word(push_amount);
		}
	
		x += push_amount;
	}






}
