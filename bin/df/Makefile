TOPSRC!=cd ../..; pwd
include ${TOPSRC}/target.mk

# Must run set-group-id operator.

BINDIR=		/bin
BINMODE=	2751

PROG=		df

OBJS=		${PROG}.o

all:		${PROG}

${PROG}:	${OBJS}
		${CC} ${CFLAGS} ${LDFLAGS} -o $@ ${OBJS} ${LIBS}

clean:
		rm -f *.o *.elf ${PROG} *.dis tags *~

install:	all
		install -m ${BINMODE} ${PROG} ${DESTDIR}${BINDIR}/${PROG}
