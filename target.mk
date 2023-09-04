# Override the default port with:
# $ make MACHINE=pic32 MACHINE_ARCH=mips
#
MACHINE=	pic32
MACHINE_ARCH=	mips

DESTDIR?=	${TOPSRC}/distrib/obj/destdir.${MACHINE}
RELEASE=	2.1
BUILD!=		git rev-list HEAD --count
VERSION=	${RELEASE}-${BUILD}

TOOLDIR?=	${TOPSRC}/tools
TOOLBINDIR?=	${TOOLDIR}/bin

HOST_CC?=	cc

_HOST_OSNAME!=	uname -s

GCCPREFIX!=if [ x"${MACHINE_ARCH}" = x"arm" ] ; then \
		if [ x"${_HOST_OSNAME}" = x"OpenBSD" ] ; then \
			echo "/usr/local/bin/arm-none-eabi" ; \
		elif [ x"${_HOST_OSNAME}" = x"FreeBSD" ] ; then \
			echo "/usr/local/gcc-arm-embedded/bin/arm-none-eabi" ; \
		elif [ x"${_HOST_OSNAME}" = x"Linux" ] ; then \
			echo "/usr/bin/arm-none-eabi" ; \
		else \
			echo "/does/not/exist" ; \
		fi \
	elif [ x"${MACHINE_ARCH}" = x"mips" ] ; then \
		if [ x"${_HOST_OSNAME}" = x"OpenBSD" ] ; then \
			echo "/usr/local/bin/mips-elf" ; \
		elif [ x"${_HOST_OSNAME}" = x"FreeBSD" ] ; then \
			echo "/usr/local/mips-elf/bin/mips-elf" ; \
		elif [ x"${_HOST_OSNAME}" = x"Linux" ] ; then \
			echo "~/x-tools/mipsel-none-elf/bin/mipsel-none-elf" ; \
		else \
			echo "/does/not/exist" ; \
		fi \
	else \
		echo "/does/not/exist" ; \
	fi

CC!=	if [ x"${MACHINE_ARCH}" = x"arm" ] ; then \
		echo "${GCCPREFIX}-gcc -mcpu=cortex-m4 -mabi=aapcs -mlittle-endian -mthumb -mfloat-abi=soft -nostdinc -I${TOPSRC}/include ${INCLUDES}" ; \
	elif [ x"${MACHINE_ARCH}" = x"mips" ] ; then \
		echo "${GCCPREFIX}-gcc -mips32r2 -EL -msoft-float -nostdinc -ffreestanding -I${TOPSRC}/include ${INCLUDES}" ; \
	else \
		echo "/does/not/exist" ; \
	fi

# Enable mips16e instruction set by default
COPTS!=if [ x"${MACHINE_ARCH}" = x"arm" ] ; then \
		echo "-Os" ; \
	elif [ x"${MACHINE_ARCH}" = x"mips" ] ; then \
		echo "-Os -G0 -mips16 -ffunction-sections" ; \
	else \
		echo "" ; \
	fi

CFLAGS=	${COPTS}

AFLAGS=	${ASFLAGS}

LDFLAGS=-Wl,--gc-sections -N -nostartfiles -fno-dwarf2-cfi-asm -T${TOPSRC}/lib/elf32-${MACHINE_ARCH}.ld ${TOPSRC}/lib/crt0.o -L${TOPSRC}/lib

LIBS=	-lc
LDLIBS=	${LIBS}

OBJDUMP!=if [ x"${MACHINE_ARCH}" = x"arm" ] ; then \
		echo "${GCCPREFIX}-objdump -marm -M force-thumb" ; \
	elif [ x"${MACHINE_ARCH}" = x"mips" ] ; then \
		echo "${GCCPREFIX}-objdump -mmips:isa32r2" ; \
	else \
		echo "/does/not/exist" ; \
	fi

YACC!=	if [ x"${_HOST_OSNAME}" = x"Linux" ] ; then \
		echo "byacc" ; \
	else \
		echo "yacc" ; \
	fi

YFLAGS=	-d

LD=		${GCCPREFIX}-ld
AR=		${GCCPREFIX}-ar
RANLIB=		${GCCPREFIX}-ranlib
SIZE=		${GCCPREFIX}-size
AS=		${CC} -x assembler-with-cpp -c

LEX=		flex
INSTALL=	install -m 644
INSTALLDIR=	install -m 755 -d
TAGSFILE=	tags

#MANROFF=	nroff -man -h -Tascii
MANROFF=	mandoc -Tascii

ELF2AOUT=	cp
AOUT_AOUT=	${TOOLBINDIR}/aout
AOUT_AR=	${TOOLBINDIR}/ar
AOUT_AS=	${TOOLBINDIR}/as
AOUT_LD=	${TOOLBINDIR}/ld
AOUT_NM=	${TOOLBINDIR}/nm
AOUT_RANLIB=	${TOOLBINDIR}/ranlib
AOUT_SIZE=	${TOOLBINDIR}/size
AOUT_STRIP=	${TOOLBINDIR}/strip
