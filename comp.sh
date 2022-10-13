cc -Wall -Wpedantic -g -rdynamic -fPIC -shared -o libtoxprpl.so src/toxprpl.c $(pkg-config --libs --cflags glib-2.0) $(pkg-config --libs --cflags purple) -I../toxcore/ -L../toxcore/build -ltoxcore
