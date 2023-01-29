function TaskMineStone(_player) : Task(_player) constructor {
	self.skillKey = "mining";
	self.key = "task_mine_stone";
	self.name = "Mining Stone";
	self.shortName = "STN";
	self.requiredSeconds = 3;
	self.xpReward = 3;
	self.minLevel = 0;
	self.image = sprite_stone;
}