function Task(_player) constructor
{
	player = _player
	self.requiredSeconds = 0;
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
	
	/// @return {Struct.Skill}
	function getSkill()
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
		
		draw_set_color(c_task_xp)
		draw_text(x + w - offsetX, y + lineHeight * line, xpText);
		draw_set_color(c_primary);
		
		line++;
		
		draw_set_color(c_task_xp)
		xpBar.draw(x, y + lineHeight * line);
		draw_set_color(c_primary);
		
		// rewards (one line)
		var font = draw_get_font();
		draw_set_font(font_s1p12);
		
		var color = draw_get_color();
		draw_set_color(c_skill_xp);
		draw_text(x, y + lineHeight * line + 10, ucfirst(getSkill().name) + " XP: " + string(xpReward));
		draw_set_color(color);
		
		var masteryXpText = "Mastery XP: 0";  // todo: implement mastery xp
		var color = draw_get_color();
		draw_set_color(c_skill_mastery);
		draw_text(x + (w - string_width(masteryXpText)) / 2, y + lineHeight * line + 10, masteryXpText);
		draw_set_color(color);
		
		var taskXpText = "Task XP: 0"; // todo: implement task xp
		var color = draw_get_color();
		draw_set_color(c_task_xp);
		draw_text(x + w - string_width(taskXpText), y + lineHeight * line + 10, taskXpText); 
		draw_set_color(color);
		
		draw_set_font(font);
		line++;
		line++;
		
		// progress bar (thick)
		progressBar.draw(x, y + lineHeight * line);
		
		// duration, remaining tasks and ETA (one line)
		var font = draw_get_font();
		
		draw_set_font(font_s1p12);
		draw_text(x, y + lineHeight * line + 16, "Duration: " + string_format(requiredSeconds, 1, 1) + " s");
		
		var tasksRemainingText = "Reps: " + string(getTasksToNextLevel());
		draw_text(x + (w - string_width(tasksRemainingText)) / 2, y + lineHeight * line + 16, tasksRemainingText);
		
		var secondsRemainingText = "ETA: " + eta(getSecondsToNextLevel());
		draw_text(x + w - string_width(secondsRemainingText), y + lineHeight * line + 16, secondsRemainingText);
		
		draw_set_font(font);
		line++;
		
		
		// actual rewards on task completion
	}
	
	function reset()
	{
		startTime = current_time;
	}
}