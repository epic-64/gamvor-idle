function SkillDisplay(_skill, _w, _x, _y) constructor
{
	self.skill = _skill;
	self.w = _w;
	self.x = _x;
	self.y = _y;
	
	lineHeight = 40;
	
	xpBar = new ProgressBar(w, 10)
	
	levelUpButton = new LevelUpButton(skill, x + 400, y, 100, 30, "+");
	
	function step() // void
	{
		levelUpButton.step();
	}
	
	function draw() // void
	{
		var text = skill.name + " (" + string(skill.level) + "/" + string(skill.maxLevel) + ")";
		draw_text(x, y + lineHeight * 0, text);
		
		text = string(skill.xp) + " / " + string(skill.getXpRequirement()) + " XP"
		draw_text(x + 200, y + lineHeight * 0, text);
		
		levelUpButton.draw();
		
		xpBar.setProgress(skill.getProgress());
		xpBar.draw(x, y + lineHeight * 1);
	}
}