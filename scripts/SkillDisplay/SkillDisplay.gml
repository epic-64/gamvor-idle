function SkillDisplay(skill) constructor
{
	self.skill = skill
	
	lineHeight = 30;
	
	xpBar = new ProgressBar(400, 10)
	
	function draw(x, y)
	{
		var text = skill.name + " (" + string(skill.level) + "/" + string(skill.maxLevel) + ")";
		draw_text(x, y + lineHeight * 0, text);
		
		text = string(skill.xp) + " / " + string(skill.getXpRequirement()) + " XP"
		draw_text(x, y + lineHeight * 1, text);
		
		xpBar.setProgress(skill.getProgress());
		xpBar.draw(x, y + lineHeight * 2);
	}
}