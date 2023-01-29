function Skill() constructor
{
	tasks = [];
	
	function getXpRequirement() // int
	{
		var factor = 1 + (floor(level / 5) / 2);
		var value = power(level + 1, 2) * log2(level + 2) * factor
		
		return 8 + round(value);
	}
	
	function getRemainingXp() // int
	{
		return getXpRequirement() - xp;
	}
	
	function addXp(amount) // void
	{
		xp += amount;
		
		if level >= maxLevel {
			return;
		}
		
		while xp >= getXpRequirement() {
			levelUp();
		}
	}
	
	function levelUp() // void
	{
		xp -= getXpRequirement();
		
		level++;
	}
	
	function getProgress() // float, min: 0.0, max: 1.0
	{
		return xp / getXpRequirement();
	}
	
	function getTask(taskKey)
	{
		var _closure = { taskKey: taskKey }
		
		var finder = function(item) { return item.key == taskKey; }
		
		var matches = array_filter(tasks, method(_closure, finder));
		
		return array_first(matches);
	}
}