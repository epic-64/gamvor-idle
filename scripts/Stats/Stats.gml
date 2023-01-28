function Stats(x, y) constructor {
	self.x = x;
	self.y = y;
	self.lineHeight = 20;
	self.TICKS = 0;
	
	function step() {
	    self.TICKS++;
	}
	
	function draw() {
		draw_text(x, y + lineHeight * 0, "steps: " + string(self.TICKS));
		draw_text(x, y + lineHeight * 1, "time: " + string(current_time / 1000));
		draw_text(x, y + lineHeight * 2, "fps: " + string(fps));
		draw_text(x, y + lineHeight * 3, "fps_real: " + string(fps_real));
	}
}