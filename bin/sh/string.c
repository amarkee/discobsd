/*
 * UNIX shell
 *
 * Bell Telephone Laboratories
 */
#include "defs.h"

/* ========     general purpose string handling ======== */

char *
movstr(a, b)
char   *a, *b;
{
	while (*b++ = *a++);
	return(--b);
}

any(c, s)
char   c;
char    *s;
{
	char d;

	while (d = *s++)
	{
		if (d == c)
			return(TRUE);
	}
	return(FALSE);
}

cf(s1, s2)
char *s1, *s2;
{
	while (*s1++ == *s2)
		if (*s2++ == '\0')
			return(0);
	return *--s1 - *s2;
}

length(as)
char    *as;
{
	char   *s;

	if (s = as)
		while (*s++);
	return(s - as);
}

char *
movstrn(a, b, n)
	char *a, *b;
	int n;
{
	while ((n-- > 0) && *a)
		*b++ = *a++;

	return(b);
}
