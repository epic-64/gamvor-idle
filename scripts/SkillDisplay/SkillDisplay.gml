function SkillDisplay(_skill, _w, _x, _y) constructor
{
	self.skill = _skill;
	self.w = _w;
	self.x = _x;
	self.y = _y;
	
	lineHeight = 34;
	
	xpBar = new ProgressBar(w, 4);
	masteryBar = new ProgressBar(w, 4);
	
	levelUpButton = new LevelUpButton(skill, x + 150, y, 50, 25, "+");
	
	function step() // void
	{
		levelUpButton.step();
	}
	
	function draw() // void
	{
		var skillText = skill.name + " (" + string(skill.level) + "/" + string(skill.maxLevel) + ")";
		draw_text(x, y + lineHeight * 0, skillText);
		levelUpButton.draw();
		
		draw_set_color(c_skill_xp);
		var skillXpText = string(skill.xp) + " / " + string(skill.getXpRequirement()) + " XP";
		var offsetX = string_width(skillXpText);
		draw_text(x + w - offsetX, y + lineHeight * 0, skillXpText);
		draw_set_color(c_primary);
		
		xpBar.setProgress(skill.getProgress());
		
		draw_set_color(c_skill_xp);
		xpBar.draw(x, y + lineHeight * 1);
		draw_set_color(c_primary);
		
		var masteryText = "Mastery (" + string(skill.level) + "/" + string(skill.maxLevel) + ")";
		draw_text(x, y + lineHeight * 2, masteryText);
		
		var masteryXpText = string(skill.xp) + " / " + string(skill.getXpRequirement()) + " XP";
		var offsetX = string_width(masteryXpText);
		
		draw_set_color(c_skill_mastery);
		draw_text(x + w - offsetX, y + lineHeight * 2, masteryXpText);
		draw_set_color(c_primary);
		
		masteryBar.setProgress(skill.getProgress());
		
		draw_set_color(c_skill_mastery);
		masteryBar.draw(x, y + lineHeight * 3);
		draw_set_color(c_primary);
	}
}