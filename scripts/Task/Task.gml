function Task(_player) constructor
{
	player = _player

	lineHeight = 40;
	startTime = current_time;
	
	progressBar = new ProgressBar(400, 10);
	
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
		
		progressBar.setProgress(progress)
		
		if (progress >= 1) {
			giveReward();
			
			reset();
		}
	}
	
	function draw(x, y)
	{
		var line = 0;
		
		draw_text(x, y + lineHeight * line, "Task: " + name); line++;
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