LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
SRC_DIR :=  ../
LOCAL_MODULE := libjson-c
LIB_SRC := ${SRC_DIR}/arraylist.c \
	${SRC_DIR}/debug.c \
	${SRC_DIR}/json_c_version.c \
	${SRC_DIR}/json_object.c \
	${SRC_DIR}/json_object_iterator.c \
	${SRC_DIR}/json_pointer.c \
	${SRC_DIR}/json_tokener.c \
	${SRC_DIR}/json_util.c \
	${SRC_DIR}/json_visit.c \
	${SRC_DIR}/linkhash.c \
	${SRC_DIR}/printbuf.c \
	${SRC_DIR}/random_seed.c \
	${SRC_DIR}/strerror_override.c \
 
LOCAL_SRC_FILES := $(LIB_SRC)
LOCAL_C_INCLUDES := \
	/home/caixiwen/android-ndk-r10d/platforms/android-21/arch-arm/usr/include \
        $(SRC_DIR)/include \
	$(SRC_DIR)/compat 
 
LOCAL_CFLAGS += -static -fPIC 
include $(BUILD_STATIC_LIBRARY)


