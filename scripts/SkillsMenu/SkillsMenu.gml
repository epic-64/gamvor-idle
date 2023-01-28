function SkillsMenu(game, player, x, y) constructor
{
	self.game = game;
	self.player = player;
	self.x = x;
	self.y = y;
	
	lineHeight = 40;
	
	function draw() // void
	{
		var line = 0;
		
		draw_text(x, y + lineHeight * line, "Skills"); line++;
		
		for(var i = 0; i < array_length(player.skills); i++) {
			drawSkillButton(player.skills[i], line);
			line++;
		}
	}
	
	function drawSkillButton(skill, line) // void
	{
		// background
		var bgColor = game.selected_skill == skill.key
			? make_color_rgb(100, 200, 200)
			: make_color_rgb(100, 100, 100);
			
		draw_set_color(bgColor);
		draw_rectangle(x, y + lineHeight * line, x + 170, y + lineHeight * line + lineHeight - 10, false)
			
		// text
		draw_set_color(make_color_rgb(255, 255, 255))
		var text = skill.name + " (" + string(skill.level) + "/" + string(skill.maxLevel) + ")";
		draw_text(x + 5, y + lineHeight * line, text);
	}
}