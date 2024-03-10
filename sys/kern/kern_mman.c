/*
 * Copyright (c) 1986 Regents of the University of California.
 * All rights reserved.  The Berkeley software License Agreement
 * specifies the terms and conditions for redistribution.
 */
#include <sys/param.h>
#include <sys/user.h>
#include <sys/proc.h>
#include <sys/vm.h>
#include <sys/systm.h>

void
brk(void)
{
    struct a {
        int naddr;
    };
    int newsize, d;

    /* set newsize to new data size */
    newsize = ((struct a*)u.u_arg)->naddr - u.u_procp->p_daddr;
    if (newsize < 0)
        newsize = 0;
    if (u.u_tsize + newsize + u.u_ssize > MAXMEM) {
        u.u_error = ENOMEM;
        return;
    }

    u.u_procp->p_dsize = newsize;

    /* set d to (new - old) */
    d = newsize - u.u_dsize;
//printf ("brk: new size %u bytes, incremented by %d\n", newsize, d);
    if (d > 0)
        bzero ((void*) (u.u_procp->p_daddr + u.u_dsize), d);
    u.u_dsize = newsize;
    u.u_rval = u.u_procp->p_daddr + u.u_dsize;
}
