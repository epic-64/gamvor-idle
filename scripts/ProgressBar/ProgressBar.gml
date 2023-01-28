function ProgressBar(w, h) constructor
{
	self.w = w;
	self.h = h;
	
	self.progress = 0.0;
	
	function setProgress(progress)
	{
		self.progress = progress;
	}
	
	function draw(x, y)
	{
		draw_rectangle(x, y, x + round(w * progress), y + h, false);
		draw_rectangle(x, y, x + w, y + h, true)
	}
}