/*
 * Copyright (c) 1982, 1986 Regents of the University of California.
 * All rights reserved.  The Berkeley software License Agreement
 * specifies the terms and conditions for redistribution.
 */
#ifndef _SYS_VM_H_
#define _SYS_VM_H_

#ifdef KERNEL
#include "vmparam.h"
#include "vmmac.h"
#include "vmmeter.h"
#include "vmsystm.h"
#else
#include <sys/vmparam.h>
#include <sys/vmmac.h>
#include <sys/vmmeter.h>
#include <sys/vmsystm.h>
#endif

#endif