function SkillSelectButton(game, skillKey, x, y, w, h, text): Button(x, y, w, h, text) constructor
{
	self.game = game;
	self.skillKey = skillKey;
	
	function onClick()
	{
		if isSelected() {
			skillUi.swapToTask("");
		} else {
			skillUi.swapToTask(taskKey);
		}
	}
	
	function draw() // void
	{
		draw_set_color(c_white);
		
		if isSelected()
		{
			draw_rectangle(x, y, x + w, y + h, false);
			
			draw_set_color(c_black);
			draw_text(x, y, text);
		} else {
			draw_rectangle(x, y, x + w, y + h, true);
			draw_text(x, y, text);
		}
		
		draw_set_color(c_white);
	}
	
	function isSelected()
	{
		return skillUi.selectedTask == taskKey;
	}
}