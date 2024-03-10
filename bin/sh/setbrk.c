/*
 * UNIX shell
 *
 * Bell Telephone Laboratories
 */
#include "defs.h"

char 	*sbrk();

char *
setbrk(incr)
int	incr;
{
	char *a = sbrk(incr);

	brkend = a + incr;
	return(a);
}
