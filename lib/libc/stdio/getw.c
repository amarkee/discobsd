#include <stdio.h>

int
getw(iop)
        register FILE *iop;
{
	int i;
	char *p;
	int w;

	p = (char *)&w;
	for (i=sizeof(int); --i>=0;)
		*p++ = getc(iop);
	if (feof(iop))
		return(EOF);
	return(w);
}

#ifdef pdp11
long
getlw(iop)
register FILE *iop;
{
	int i;
	char *p;
	long w;

	p = (char *)&w;
	for (i=sizeof(long); --i>=0;)
		*p++ = getc(iop);
	if (feof(iop))
		return(EOF);
	return(w);
}
#endif
