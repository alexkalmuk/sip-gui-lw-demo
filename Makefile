EXE := pjsua_nuklear_demo

PJSIP_LDLIBS := -lpjsua-x86_64-unknown-linux-gnu \
	-lpjsip-ua-x86_64-unknown-linux-gnu \
	-lpjsip-simple-x86_64-unknown-linux-gnu \
	-lpjsip-x86_64-unknown-linux-gnu \
	-lpjmedia-codec-x86_64-unknown-linux-gnu \
	-lpjmedia-x86_64-unknown-linux-gnu \
	-lpjmedia-videodev-x86_64-unknown-linux-gnu \
	-lpjmedia-audiodev-x86_64-unknown-linux-gnu \
	-lpjmedia-x86_64-unknown-linux-gnu \
	-lpjnath-x86_64-unknown-linux-gnu \
	-lpjlib-util-x86_64-unknown-linux-gnu \
	-lsrtp-x86_64-unknown-linux-gnu \
	-lresample-x86_64-unknown-linux-gnu \
	-lgsmcodec-x86_64-unknown-linux-gnu \
	-lspeex-x86_64-unknown-linux-gnu \
	-lilbccodec-x86_64-unknown-linux-gnu \
	-lg7221codec-x86_64-unknown-linux-gnu \
	-lwebrtc-x86_64-unknown-linux-gnu \
	-lpj-x86_64-unknown-linux-gnu \
	-luuid -lrt -lm -lpthread  -lasound

NUKLEAR_LDLIBS := -lX11 -lXext -lm

LDLIBS := $(PJSIP_LDLIBS) $(NUKLEAR_LDLIBS)

CPPFLAGS += -I$(PJSIP_INSTALL_DIR)/include -I$(NUKLEAR_INSTALL_DIR)
CFLAGS += -Wall -Werror -Wno-misleading-indentation -Wno-unused-function
LDFLAGS += -L$(PJSIP_INSTALL_DIR)/lib $(LDLIBS)

SRCS = main.c pjsua.c nuklear_main.c
OBJS = $(SRCS:.c=.o)

%.o: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

all: $(OBJS)
	$(CC) -o $(EXE) $(OBJS) $(LDFLAGS)

clean:
	rm -rf $(OBJS) $(EXE)
