LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
SRC_DIR :=  ../
LOCAL_MODULE := libevent_openssl
LIB_SRC := ${SRC_DIR}/buffer.c \
	${SRC_DIR}/bufferevent.c \
	${SRC_DIR}/bufferevent_filter.c \
	${SRC_DIR}/bufferevent_pair.c \
	${SRC_DIR}/bufferevent_ratelim.c \
	${SRC_DIR}/bufferevent_sock.c \
	${SRC_DIR}/event.c \
	${SRC_DIR}/evmap.c \
	${SRC_DIR}/evthread.c \
	${SRC_DIR}/evutil.c \
	${SRC_DIR}/evutil_rand.c \
	${SRC_DIR}/evutil_time.c \
	${SRC_DIR}/listener.c \
	${SRC_DIR}/log.c \
	${SRC_DIR}/strlcpy.c \
	${SRC_DIR}/select.c \
	${SRC_DIR}/poll.c \
	${SRC_DIR}/epoll.c \
	${SRC_DIR}/signal.c \
	${SRC_DIR}/evdns.c \
	${SRC_DIR}/event_tagging.c \
	${SRC_DIR}/evrpc.c \
	${SRC_DIR}/http.c \
 
LOCAL_SRC_FILES := $(LIB_SRC)
LOCAL_C_INCLUDES := \
        $(SRC_DIR)/include \
	$(SRC_DIR)/compat 

LOCAL_CFLAGS += -static -fPIC 
include $(BUILD_STATIC_LIBRARY)


