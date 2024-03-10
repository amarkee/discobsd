/*
 * Copy string s2 to s1.  s1 must be large enough.
 * return s1
 */
#include <string.h>

char *
strcpy(s1, s2)
	char *s1;
	register const char *s2;
{
	char *os1;

	os1 = s1;
	while ((*s1++ = *s2++))
		;
	return(os1);
}
