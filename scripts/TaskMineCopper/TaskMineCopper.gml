function TaskMineCopper(_player) : Task(_player) constructor {
	self.skillKey = "mining";
	self.key = "task_mine_copper";
	self.name = "Mine Copper";
	self.requiredSeconds = 3;
	self.xpReward = 3;
}