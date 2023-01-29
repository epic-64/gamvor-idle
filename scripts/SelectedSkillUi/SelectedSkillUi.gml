function SelectedSkillUi(_game, _player, x, y) constructor
{
	self.game = _game;
	self.player = _player;
	self.x = x;
	self.y = y;
	
	self.w = 480;
	
	skill = player.getSkill(game.selected_skill);
	
	skillDisplay = new SkillDisplay(skill, self.w);
	
	taskButtons = [];
	
	var startY = y + 70;
	var currY = startY;
		
	var startX = x;
	var currX = startX;
	for (var i = 0; i < array_length(skill.tasks); i++)
	{
		var task = skill.tasks[i];
		
		if i > 0 && i mod 4 == 0 {
			currY += 50;
			currX = startX;
		}
		
		var button = new TaskSelectButton(self, task.key, currX, currY, w/4, 50, task.shortName);
		currX += w/4;
		
		array_push(taskButtons, button);
	}
	
	selectedTask = "";
	
	function step() // void
	{
		for (var i = 0; i < array_length(taskButtons); i++) {
			taskButtons[i].step();
		}
		
		if (selectedTask == "") {
			return;
		}
		
		skill.getTask(selectedTask).step();
	}
	
	function draw() // void
	{
		skillDisplay.draw(x, y);
		
		for (var i = 0; i < array_length(taskButtons); i++) {
			taskButtons[i].draw();
		}
		
		if (selectedTask == "") {
			return;
		}
		
		skill.getTask(selectedTask).draw(x, y + 300);
	}
	
	function swapToTask(skillKey)
	{
		selectedTask = skillKey;
		
		if (skillKey != "") {
			skill.getTask(selectedTask).reset();	
		}
	}
}