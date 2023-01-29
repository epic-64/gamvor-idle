function Task(_player) constructor
{
	player = _player

	self.w = 400;
	minLevel = 0;
	lineHeight = 34;
	startTime = current_time;
	image = sprite_stone;
	
	progressBar = new ProgressBar(w, 10);
	xpBar = new ProgressBar(w, 4);
	
	function giveReward() // void
	{
		getSkill().addXp(xpReward);
	}
	
	function getSkill() // Skill
	{
		return player.getSkill(skillKey);
	}
	
	function getTasksToNextLevel() // int
	{
		return ceil(getSkill().getRemainingXp() / xpReward);
	}
	
	function getSecondsToNextLevel() // int
	{
		return ceil(requiredSeconds * getTasksToNextLevel());
	}

	function step()
	{
		var elapsedSeconds = (current_time - startTime) / 1000;
		var progress = elapsedSeconds / requiredSeconds;
		
		progressBar.setProgress(progress);
		xpBar.setProgress(0.5); // todo: implement task xp
		
		if (progress >= 1) {
			giveReward();
			
			reset();
		}
	}
	
	function draw(x, y) // void
	{
		var line = 0;
	
		// description
		draw_text(x, y + lineHeight * line, name + " (0/99)");
		
		// xp bar with label
		var xpText = "137/2345 XP"; // todo: implement task xp
		var offsetX = string_width(xpText);
		draw_text(x + w - offsetX, y + lineHeight * line, xpText);
		line++;
		xpBar.draw(x, y + lineHeight * line);
		
		// rewards (one line)
		var font = draw_get_font();
		draw_set_font(font_s1p12);
		draw_text(x, y + lineHeight * line + 10, ucfirst(getSkill().name) + " XP: " + string(xpReward));
		
		var masteryXpText = "Mastery XP: 0";  // todo: implement mastery xp
		draw_text(x + (w - string_width(masteryXpText)) / 2, y + lineHeight * line + 10, masteryXpText);
		
		var taskXpText = "Task XP: 0"; // todo: implement task xp
		draw_text(x + w - string_width(taskXpText), y + lineHeight * line + 10, taskXpText); 
		draw_set_font(font);
		line++;
		
		// progress bar (thick)
		
		
		// time till level up (one line)
		
		
		// actual rewards on task completion
		
		
		draw_text(x, y + lineHeight * line, "Takes: " + string_format(requiredSeconds, 1, 1) + " seconds"); line++;
		draw_text(x, y + lineHeight * line, "Reward: " + string(xpReward) + " XP"); line++;
		
		progressBar.draw(x, y + lineHeight * line); line++;
		
		draw_text(x, y + lineHeight * line, "tasks remaining: " + string(getTasksToNextLevel())); line++;
		draw_text(x, y + lineHeight * line, "seconds remaining: " + string(getSecondsToNextLevel())); line++;
	}
	
	function reset()
	{
		startTime = current_time;
	}
}