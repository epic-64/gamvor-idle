function Stats() constructor {
	self.TICKS = 0;
	
	function step() {
	    self.TICKS++;
	}
	
	function draw() {
		draw_text(10, 10, "steps: " + string(self.TICKS));
		draw_text(10, 30, "time: " + string(current_time / 1000));
		draw_text(10, 50, "fps: " + string(fps));
		draw_text(10, 70, "fps_real: " + string(fps_real));
	}
}