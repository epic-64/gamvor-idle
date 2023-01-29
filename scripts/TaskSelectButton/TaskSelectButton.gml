function TaskSelectButton(skillUi, taskKey, x, y, w, h, text): Button(x, y, w, h, text) constructor
{
	self.skillUi = skillUi;
	self.taskKey = taskKey;
	
	function onClick()
	{
		if ! isAvailable() {
			return;
		}
		
		if isSelected() {
			skillUi.swapToTask("");
		} else {
			skillUi.swapToTask(taskKey);
		}
	}
	
	function draw() // void
	{	
		if isSelected()
		{
			draw_rectangle(x, y, x + w, y + h, false);
			
			draw_set_color(c_black);
			draw_text(x, y, text);
		} else {
			draw_rectangle(x, y, x + w, y + h, true);
			
			draw_set_color(isAvailable() ? c_white : c_gray);
			
			draw_text(x, y, isAvailable() ? text : "lvl " + string(getMinLevel()));
		}
		
		draw_set_color(c_white);
		
		draw_sprite(getTask().image, 0, x, y);
	}
	
	function isSelected()
	{
		return skillUi.selectedTask == taskKey;
	}
	
	function isAvailable()
	{
		return skillUi.skill.level >= getMinLevel();
	}
	
	function getMinLevel()
	{
		return getTask().minLevel;
	}
	
	function getTask() // task
	{
		return skillUi.skill.getTask(taskKey);
	}
}