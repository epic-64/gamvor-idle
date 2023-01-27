// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function Player() constructor
{
	self.skills =
	{
		mining: {
			name: "mining",
			level: 1,
			
			getLine: function() // string
			{
				return string(name) + ": " + string(level);
			}
		}
	};
}