/// @param {int} _seconds
/// @returns {string} eta
function eta(_seconds)
{
	var days = floor(_seconds / 86400);
	_seconds = _seconds mod 86400;
	
	var hours = floor(_seconds / 3600);
	_seconds = _seconds mod 3600;
	
	var minutes = floor(_seconds / 60);
	_seconds = _seconds mod 60;
	
	var out = string(_seconds) + "s";
	
	if (minutes > 0) {
		out = string(minutes) + "m " + out;
	}
	
	if (hours > 0) {
		out = string(hours) + "h " + out;
	}
	
	if (days > 0) {
		out = string(days) + "d " + out;
	}
	
	return out;
}