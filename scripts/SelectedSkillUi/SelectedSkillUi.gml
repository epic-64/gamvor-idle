function SelectedSkillUi(_game, _player, x, y) constructor
{
	self.game = _game;
	self.player = _player;
	self.x = x;
	self.y = y;
	
	self.w = 400;
	self.buttonHeight = 100;
	
	skill = player.getSkill(game.selected_skill);
	
	skillDisplay = new SkillDisplay(skill, self.w, x, y);
	
	taskButtons = [];
	
	var startY = y + 70;
	var currY = startY;
		
	var startX = x;
	var currX = startX;
	
	for (var i = 0; i < array_length(skill.tasks); i++)
	{
		var task = skill.tasks[i];
		
		if i > 0 && i mod 4 == 0 {
			currY += self.buttonHeight;
			currX = startX;
		}
		
		var button = new TaskSelectButton(self, task.key, currX, currY, w/4, self.buttonHeight, task.shortName);
		currX += w/4;
		
		array_push(taskButtons, button);
	}
	
	selectedTask = "";
	
	function step() // void
	{
		skillDisplay.step();
		
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
		skillDisplay.draw();
		
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