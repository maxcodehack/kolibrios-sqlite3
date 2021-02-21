### Writed by maxcodehack

CC = kos32-gcc
LD = kos32-ld

## Path to /contrib/sdk
SDK_DIR = /media/maxim/E22406D62406AE1B/SVNKOS/contrib/sdk

CFLAGS = -c -fno-ident -O2 -fomit-frame-pointer -fno-ident -U__WIN32__ -U_Win32 -U_WIN32 -U__MINGW32__ -UWIN32   -D_HAVE_SQLITE_CONFIG_H -DBUILD_sqlite -DNDEBUG -DSQLITE_THREADSAFE=0 -DSQLITE_ENABLE_MATH_FUNCTIONS -DSQLITE_HAVE_ZLIB=1 -DSQLITE_TEMP_STORE=1
LDFLAGS = -static -S -nostdlib -T $(SDK_DIR)/sources/newlib/app.lds --image-base 0

INCLUDES = -I$(SDK_DIR)/sources/newlib/libc/include -I. -I$(SDK_DIR)/sources/zlib
LIBPATH = -L $(SDK_DIR)/lib -L /home/autobuild/tools/win32/mingw32/lib


##########################

SRC = $(notdir $(wildcard *.c))

##########################

default: $(patsubst %.c,%.o,$(SRC))
	ar rcs libsqlite.a $(patsubst %.c,%.o,$(SRC))

%.o : %.c Makefile
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ $<

clean:
	rm -rf $(patsubst %.c,%.o,$(SRC))
