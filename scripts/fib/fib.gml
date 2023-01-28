function fib(n)
{
    var smaller = 0;
    var bigger = 1;
    var sum = 0;
	
    for (i = 0; i < n; i++) {
        sum = smaller + bigger;
        smaller = bigger;
        bigger = sum;
    }
	
    return bigger;
}