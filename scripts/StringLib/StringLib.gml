/// @param string input
/// @return string
function ucfirst(input)
{
	var output = input;
	
	var first = string_char_at(output, 1);
	first = string_upper(first);

	output = string_delete(output, 1, 1);
	output = string_insert(first, output, 1);
	
	return output;
}