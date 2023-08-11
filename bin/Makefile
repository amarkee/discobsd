#
# Copyright (c) 1980 Regents of the University of California.
# All rights reserved.  The Berkeley software License Agreement
# specifies the terms and conditions for redistribution.
#
TOPSRC!=cd ..; pwd
include ${TOPSRC}/target.mk

SUBDIR=	\
	cat \
	chgrp \
	chmod \
	cp \
	date \
	dd \
	df \
	echo \
	ed \
	expr \
	hostname \
	kill \
	ln \
	ls \
	md5 \
	mkdir \
	mv \
	ps \
	pwd \
	rm \
	rmdir \
	sh \
	stty \
	sleep \
	sync \
	test \
	tar


all:		${SUBDIR}

${SUBDIR}:
		${MAKE} -C $@ ${MFLAGS}

install:
		-for i in ${SUBDIR}; do \
			${MAKE} -C $$i ${MFLAGS} DESTDIR=${DESTDIR} install; done

clean:
		/bin/rm -f a.out core *.s *.o *.dis *.elf *~ y.tab.[ch] errs
		for i in ${SUBDIR}; do (cd $$i; ${MAKE} ${MFLAGS} clean); done
