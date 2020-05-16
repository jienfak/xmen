<mkconfig

VERSION = 4.9
CPPFLAGS = $ADDCPPFLAGS\
	-DVERSION=\"$VERSION\" -D_DEFAULT_SOURCE\
	-D_BSD_SOURCE -D_XOPEN_SOURCE=700 -D_POSIX_C_SOURCE=200809L\
	$XINERAMAFLAGS\
	-I$X11INC -I$USRINC/freetype2
CFLAGS = $ADDCFLAGS 
LDFLAGS = -L$X11LIB -lX11\
	-lfontconfig -lXft\
	$XINERAMALIB

SRC = `{ ls *.c }


OBJ = ${SRC:%.c=%.o}
HDR = `{ ls *.h }
TGT = $NAME

all :VQ: $TGT
	echo -n
$TGT : $OBJ
	$LD $LDFLAGS -o $target $prereq
%.o : %.c
	$CC $CFLAGS $CPPFLAGS -c -o $target $prereq
%.c :Q: $HDR
	echo -n
%.h :Q:
	echo -n
install : $TGT
	cp -f $TGT $BIN/
	chmod 0755 $BIN/$TGT
uninstall: 
	rm -rf $BIN/$TGT
clean :
	rm -rf $TGT *.o 
