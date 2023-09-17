#
# Copyright (c) 1980 Regents of the University of California.
# All rights reserved.  The Berkeley software License Agreement
# specifies the terms and conditions for redistribution.
#
TOPSRC!=cd ..; pwd
include $(TOPSRC)/target.mk

MDSUBDIR!=if [ x"${MACHINE_ARCH}" = x"arm" ] ; then \
		echo "" ; \
	elif [ x"${MACHINE_ARCH}" = x"mips" ] ; then \
		echo "aout as" ; \
	else \
		echo "" ; \
	fi

SUBDIR = \
    ar \
    arch \
    awk \
    chflags \
    chpass \
    dc \
    diff \
    env \
    find \
    fold \
    fstat \
    id \
    la \
    login \
    make \
    man \
    more \
    nm \
    passwd \
    printf \
    sed \
    setty \
    uname \
    xargs \
    zmodem \
    msec \
    compress \
    whereis \
    ${MDSUBDIR} \
    basename \
    cmp \
    comm \
    diskspeed \
    du \
    fgrep \
    file \
    grep \
    head \
    hostid \
    join \
    last \
    mesg \
    nice \
    od \
    pagesize \
    pr \
    printenv \
    rev \
    size \
    sort \
    sum \
    tail \
    tee \
    time \
    touch \
    tr \
    tsort \
    tty \
    uniq \
    w \
    wc \
    who \
    bc \
    egrep \
    mail \
    su \
    vmstat \
    wall \
    write \
    false \
    nohup \
    true


all:		$(SUBDIR)

$(SUBDIR):
		$(MAKE) -C $@ $(MFLAGS)


install:
		-for i in $(SUBDIR); do \
			$(MAKE) -C $$i $(MFLAGS) DESTDIR=$(DESTDIR) install; done

clean:
		/bin/rm -f a.out core *.s *.o *.dis *.elf *~ y.tab.[ch] errs
		for i in $(SUBDIR); do (cd $$i; $(MAKE) $(MFLAGS) clean); done
