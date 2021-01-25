### Writed by maxcodehack

CC = kos32-gcc
LD = kos32-ld

## Path to /contrib/sdk
SDK_DIR = /home/autobuild/tools/win32/sdk

CFLAGS = -c -fno-ident -O2 -fomit-frame-pointer -fno-ident -U__WIN32__ -U_Win32 -U_WIN32 -U__MINGW32__ -UWIN32 -D_HAVE_SQLITE_CONFIG_H -DBUILD_sqlite -DNDEBUG -DSQLITE_THREADSAFE=0 -DSQLITE_ENABLE_MATH_FUNCTIONS -DSQLITE_HAVE_ZLIB=1 -DSQLITE_TEMP_STORE=1
LDFLAGS = -static -S -nostdlib -T $(SDK_DIR)/sources/newlib/app.lds --image-base 0

INCLUDES = -I $(SDK_DIR)/sources/newlib/libc/include -Isrc -I.
LIBPATH = -L $(SDK_DIR)/lib -L /home/autobuild/tools/win32/mingw32/lib


##########################

TOP = .

SRC = \
  $(TOP)/src/alter.c \
  $(TOP)/src/vdbeaux.c \
  $(TOP)/src/analyze.c \
  $(TOP)/src/attach.c \
  $(TOP)/src/auth.c \
  $(TOP)/src/backup.c \
  $(TOP)/src/bitvec.c \
  $(TOP)/src/btmutex.c \
  $(TOP)/src/btree.c \
  $(TOP)/src/build.c \
  $(TOP)/src/callback.c \
  $(TOP)/src/complete.c \
  $(TOP)/src/ctime.c \
  $(TOP)/src/date.c \
  $(TOP)/src/dbpage.c \
  $(TOP)/src/dbstat.c \
  $(TOP)/src/delete.c \
  $(TOP)/src/expr.c \
  $(TOP)/src/fault.c \
  $(TOP)/src/fkey.c \
  $(TOP)/src/func.c \
  $(TOP)/src/global.c \
  $(TOP)/src/hash.c \
  $(TOP)/src/insert.c \
  $(TOP)/src/legacy.c \
  $(TOP)/src/loadext.c \
  $(TOP)/src/main.c \
  $(TOP)/src/malloc.c \
  $(TOP)/src/mem0.c \
  $(TOP)/src/mem1.c \
  $(TOP)/src/mem2.c \
  $(TOP)/src/mem3.c \
  $(TOP)/src/mem5.c \
  $(TOP)/src/memdb.c \
  $(TOP)/src/memjournal.c \
  $(TOP)/src/mutex.c \
  $(TOP)/src/mutex_noop.c \
  $(TOP)/src/mutex_unix.c \
  $(TOP)/src/mutex_w32.c \
  $(TOP)/src/notify.c \
  $(TOP)/src/os.c \
  $(TOP)/src/os_win.c \
  $(TOP)/src/pager.c \
  $(TOP)/src/pcache.c \
  $(TOP)/src/pcache1.c \
  $(TOP)/src/pragma.c \
  $(TOP)/src/prepare.c \
  $(TOP)/src/printf.c \
  $(TOP)/src/random.c \
  $(TOP)/src/resolve.c \
  $(TOP)/src/rowset.c \
  $(TOP)/src/select.c \
  $(TOP)/src/status.c \
  $(TOP)/src/table.c \
  $(TOP)/src/threads.c \
  $(TOP)/src/tokenize.c \
  $(TOP)/src/treeview.c \
  $(TOP)/src/trigger.c \
  $(TOP)/src/utf.c \
  $(TOP)/src/update.c \
  $(TOP)/src/upsert.c \
  $(TOP)/src/util.c \
  $(TOP)/src/vacuum.c \
  $(TOP)/src/vdbe.c \
  $(TOP)/src/vdbeapi.c \
  $(TOP)/src/vdbeaux.c \
  $(TOP)/src/vdbeblob.c \
  $(TOP)/src/vdbemem.c \
  $(TOP)/src/vdbesort.c \
  $(TOP)/src/vdbetrace.c \
  $(TOP)/src/vdbevtab.c \
  $(TOP)/src/vtab.c \
  $(TOP)/src/wal.c \
  $(TOP)/src/walker.c \
  $(TOP)/src/where.c \
  $(TOP)/src/wherecode.c \
  $(TOP)/src/whereexpr.c \
  $(TOP)/src/window.c \
  $(TOP)/parse.c

##########################

default: $(patsubst %.c,%.o,$(SRC))
	ar rcs libsqlite.a $(patsubst %.c,%.o,$(SRC))

%.o : %.c Makefile
	$(CC) $(CFLAGS) $(INCLUDES) -o $@ $<

clean:
	rm -rf $(patsubst %.c,%.o,$(SRC))
