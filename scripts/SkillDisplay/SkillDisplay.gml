function SkillDisplay(_skill, _w, _x, _y) constructor
{
	self.skill = _skill;
	self.w = _w;
	self.x = _x;
	self.y = _y;
	
	lineHeight = 34;
	
	xpBar = new ProgressBar(w, 4);
	masteryBar = new ProgressBar(w, 4);
	
	levelUpButton = new LevelUpButton(skill, x + 200, y, 100, 25, "+");
	
	function step() // void
	{
		levelUpButton.step();
	}
	
	function draw() // void
	{
		var skillText = skill.name + " (" + string(skill.level) + "/" + string(skill.maxLevel) + ")";
		draw_text(x, y + lineHeight * 0, skillText);
		
		levelUpButton.draw();
		
		var skillXpText = string(skill.xp) + " / " + string(skill.getXpRequirement()) + " XP";
		var offsetX = string_width(skillXpText);
		draw_text(x + w - offsetX, y + lineHeight * 0, skillXpText);
		
		xpBar.setProgress(skill.getProgress());
		xpBar.draw(x, y + lineHeight * 1);
		
		var masteryText = "Mastery (" + string(skill.level) + "/" + string(skill.maxLevel) + ")";
		draw_text(x, y + lineHeight * 2, masteryText);
		
		var masteryXpText = string(skill.xp) + " / " + string(skill.getXpRequirement()) + " XP";
		var offsetX = string_width(masteryXpText);
		draw_text(x + w - offsetX, y + lineHeight * 2, masteryXpText);
		
		masteryBar.setProgress(skill.getProgress());
		masteryBar.draw(x, y + lineHeight * 3);
	}
}