/*
 * Copyright (c) 1980 Regents of the University of California.
 * All rights reserved.  The Berkeley software License Agreement
 * specifies the terms and conditions for redistribution.
 */

/*
 * ffs -- vax ffs instruction
 */
int
ffs(mask)
	int mask;
{
	int cnt;

	if (mask == 0)
		return(0);
	for (cnt = 1; !(mask&1); cnt++)
		mask >>= 1;
	return(cnt);
}
