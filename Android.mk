LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

JANSSON_SRC_FILES := \
	src/dump.c \
	src/error.c \
	src/hashtable.c \
	src/load.c \
	src/memory.c \
	src/pack_unpack.c \
	src/strbuffer.c \
	src/strconv.c \
	src/utf.c \
	src/value.c

JANSSON_CFLAGS := -I$(LOCAL_PATH)/android -I$(LOCAL_PATH)/src

# Static library
include $(CLEAR_VARS)

LOCAL_MODULE:= libyahoo_jansson
LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := $(JANSSON_SRC_FILES)
LOCAL_CFLAGS := $(JANSSON_CFLAGS)
LOCAL_PRELINK_MODULE := false

# Force enabling PIC so static library can be wrapped into shared
# library later
LOCAL_CFLAGS += -fPIC -DPIC

ifneq ($(NDK_ROOT),)
LOCAL_LDLIBS += -fuse-ld=gold 
endif
include $(BUILD_STATIC_LIBRARY)
