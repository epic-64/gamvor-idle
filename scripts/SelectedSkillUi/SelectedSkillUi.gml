function SelectedSkillUi(_game, _player, x, y) constructor
{
	self.game = _game;
	self.player = _player;
	self.x = x;
	self.y = y;
	
	skill = player.getSkill(game.selected_skill);
	skillDisplay = new SkillDisplay(skill);
	
	function step()
	{
		var tasks = skill.tasks;
		
		for(var i = 0; i < array_length(tasks); i++) {
			tasks[i].step();
		}
	}
	
	function draw() // void
	{
		skillDisplay.draw(x, y);
		
		var tasks = skill.tasks;
		
		for(var i = 0; i < array_length(tasks); i++) {
			tasks[i].draw(x + 300 * i, y + 100);
		}
	}
}