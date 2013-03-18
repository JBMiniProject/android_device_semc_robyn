LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),robyn)
    include $(all-subdir-makefiles)
endif