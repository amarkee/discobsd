TOPSRC!=cd ../..; pwd
include ${TOPSRC}/target.mk

BINDIR=		/bin

PROG=		chmod

OBJS=		${PROG}.o

all:		${PROG}

${PROG}:	${OBJS}
		${CC} ${CFLAGS} ${LDFLAGS} -o $@ ${OBJS} ${LIBS}

clean:
		rm -f *.o *.elf ${PROG} *.dis tags *~

install:	all
		install ${PROG} ${DESTDIR}${BINDIR}/${PROG}
