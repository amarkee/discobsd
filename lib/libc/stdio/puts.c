#include <stdio.h>

int
puts(s)
	register const char *s;
{
	int c;

	while ((c = *s++))
		putchar(c);
	return(putchar('\n'));
}
