function LevelUpButton(_skill, x, y, w, h, text) : Button(x, y, w, h, text) constructor
{
	self.skill = _skill;
	
	function onClick()
	{
		skill.level++;
	}
}