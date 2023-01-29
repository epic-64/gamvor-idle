function TaskMineIron(_player) : Task(_player) constructor {
	self.skillKey = "mining";
	self.key = "task_mine_iron";
	self.name = "Mine Iron";
	self.shortName = "IRN";
	self.requiredSeconds = 3;
	self.xpReward = 8;
	self.minLevel = 10;
}