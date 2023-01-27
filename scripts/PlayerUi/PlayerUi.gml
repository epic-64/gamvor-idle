// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerUi(player, x, y) constructor
{
	self.x = x
	self.y = y
	self.player = player
	
	function draw()
	{
		draw_text(x, y, self.player.skills.mining.getLine());
	}
}