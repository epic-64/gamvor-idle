function SkillMining(player) : Skill() constructor
{
	self.player = player
	
	key = "mining";
	name = "Mining";
	xp = 0;
	level = 0;
	maxLevel = 99;
	
	tasks = [
		new TaskMineCopper(player),
		new TaskMinePlatinum(player)
	];
}