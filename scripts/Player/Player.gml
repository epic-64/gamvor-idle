function Player() constructor
{
	self.skills = [
		new SkillMining(self),
		new SkillFishing(self),
	];
	
	function getSkill(skillKey) // ?Skill
	{	
		var closure = { skillKey: skillKey }
		
		var finder = function(item) { return item.key == skillKey; }
		
		var matches = array_filter(skills, method(closure, finder));
		
		return array_first(matches);
	}
}