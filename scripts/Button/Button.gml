function Button(x, y, w, h, text) constructor
{
	self.x = x;
	self.y = y;
	self.w = w;
	self.h = h;
	self.text = text;
	
	function step() // void
	{
		if ! mouse_check_button_released(mb_left) {
			return;
		}
		
		if mouse_x >= x && mouse_x <= x + w && mouse_y >= y && mouse_y <= y + h {
			onClick()
		}
	}
	
	function draw() // void
	{
		draw_rectangle(x, y, x + w, y + h, true);
		draw_text(x, y, text);
	}
	
	function onClick() {
		show_debug_message("I was clicked");
	}
}