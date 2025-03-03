if(os_browser != browser_not_a_browser){
	
	var _new_width = display_get_width();
	var _new_height = display_get_height();
	
	if(width != _new_width || height != _new_height){
		width = _new_width;
		height = _new_height;
		
		window_set_size(width,height);
	}
}

var _mouse_in_left_screen = window_mouse_get_x() < window_get_width()/2;
var _mouse_in_right_screen  = window_mouse_get_x() >= window_get_width()/2;

var _mouse_held = mouse_check_button(mb_left);

left_screen_held = _mouse_held && _mouse_in_left_screen;
right_screen_held = _mouse_held && _mouse_in_right_screen;

var _controls_usable = instance_exists(obj_bird) || (instance_exists(obj_player) && !obj_player.falling);

highlight_mobile_left = false;
highlight_mobile_right = false;

if(_mouse_held && _controls_usable){
	//immediately after a press show the mobile controls
	display_mobile_controls_interpolation = 1;
	
	highlight_mobile_left = left_screen_held;
	highlight_mobile_right = right_screen_held;
	
} else if(display_mobile_controls_interpolation > .1) {
	
	display_mobile_controls_interpolation = lerp(display_mobile_controls_interpolation,0,.01);
	
} else {
	
	display_mobile_controls_interpolation = 0;
}