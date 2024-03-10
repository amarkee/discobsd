#include <stdio.h>

int
putw(w, iop)
	int w;
        register FILE *iop;
{
	char *p;
	int i;

	p = (char *)&w;
	for (i=sizeof(int); --i>=0;)
		putc(*p++, iop);
	return(ferror(iop));
}

#ifdef pdp11
int
putlw(w, iop)
        long w;
        register FILE *iop;
{
	char *p;
	int i;

	p = (char *)&w;
	for (i=sizeof(long); --i>=0;)
		putc(*p++, iop);
	return(ferror(iop));
}
#endif
