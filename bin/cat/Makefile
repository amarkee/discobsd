TOPSRC!=cd ../..; pwd
include ${TOPSRC}/target.mk

BINDIR=		/bin

PROG=		cat

OBJS=		${PROG}.o

all:		${PROG}

${PROG}:	${OBJS}
		${CC} ${CFLAGS} ${LDFLAGS} -o $@ ${OBJS} ${LIBS}
		${SIZE} $@

clean:
		rm -f *.o *.elf ${PROG} *.dis tags *~

install:	all
		install ${PROG} ${DESTDIR}${BINDIR}/${PROG}
