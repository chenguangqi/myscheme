LOCAL_PATH := $(call my-dir)

###########################
#
# The C of ChezScheme(shared library)
#
###########################

include $(CLEAR_VARS)

SCHEME_BOOT=/opt/gits/ChezScheme/boot/arm32le
LOCAL_MODULE := scheme

LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_C_INCLUDES += $(SCHEME_BOOT)
LOCAL_C_INCLUDES += $(LOCAL_PATH)/..
#LOCAL_C_INCLUDES += $(LOCAL_PATH)/../ncurses/include
#LOCAL_C_INCLUDES += $(LOCAL_PATH)/../iconv/include

#LOCAL_EXPORT_C_INCLUDES := $(LOCAL_C_INCLUDES)

LOCAL_SRC_FILES := \
	statics.c \
	segment.c \
	alloc.c \
	symbol.c \
	intern.c \
	gcwrapper.c \
	gc-ocd.c \
	gc-oce.c \
	number.c \
	schsig.c \
	io.c \
	new-io.c \
	print.c \
	fasl.c \
	stats.c \
	foreign.c \
	prim.c \
	prim5.c \
	flushcache.c \
	schlib.c \
	thread.c \
	expeditor.c \
	scheme.c \
	arm32le.c \
	main.c


LOCAL_FORCE_STATIC_EXECUTABLE=true

LOCAL_CFLAGS += -DNOFILE=256
LOCAL_LDLIBS := -ldl -lz
#LOCAL_LDFLAGS := libz.a
#LOCAL_LDFLAGS += /opt/gits/myscheme/app/jni/iconv/lib/.libs/libiconv.a
#$(LOCAL_PATH)/../iconv/lib/.libs/libiconv.a
#LOCAL_LDFLAGS += $(LOCAL_PATH)/../ncurses/lib/libncurses.a



cmd-strip :=

include $(BUILD_EXECUTABLE)
