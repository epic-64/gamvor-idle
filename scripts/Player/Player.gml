function Player() constructor
{
	self.skills = [
		new SkillMining(self),
		new SkillFishing(self),
	];
	
	/// @param string skillKey
	/// @return {Struct.Skill}
	function getSkill(skillKey) // ?Skill
	{	
		var _closure = { skillKey: skillKey }
		
		var finder = function(item) { return item.key == skillKey; }
		
		var matches = array_filter(skills, method(_closure, finder));
		
		return array_first(matches);
	}
}