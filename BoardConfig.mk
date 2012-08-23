# Copyright (C) 2012 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# throughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from the proprietary version
-include device/semc/robyn/BoardConfigVendor.mk

# Camera
USE_CAMERA_STUB := true
BOARD_USES_ECLAIR_LIBCAMERA := true
BUILD_CAMERAHAL := true
COMMON_GLOBAL_CFLAGS += -DBINDER_COMPAT
COMMON_GLOBAL_CFLAGS += -DECLAIR_LIBCAMERA
COMMON_GLOBAL_CFLAGS += -DQCOM_ICS_COMPAT

# Include headers
TARGET_SPECIFIC_HEADER_PATH := device/semc/robyn/include

# Platform
TARGET_BOARD_PLATFORM := msm7x27
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv6-vfp
ARCH_ARM_HAVE_VFP := true
TARGET_DISABLE_ARM_PIE := true

# Info
TARGET_BOOTLOADER_BOARD_NAME := delta
TARGET_OTA_ASSERT_DEVICE := E10i,E10a,robyn
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_BOOTLOADER_BOARD_NAME=delta

# Kernel
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
BOARD_KERNEL_CMDLINE := console=null
BOARD_KERNEL_BASE := 0x20000000

# FM Radio
BOARD_HAVE_FM_RADIO := true
BOARD_HAVE_FM_RADIO_TI := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

# Wifi
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
BOARD_WLAN_DEVICE := wl1271
WPA_SUPPLICANT_VERSION := VER_0_6_X
WIFI_DRIVER_MODULE_PATH := /system/lib/modules/tiwlan_drv.ko
WIFI_DRIVER_MODULE_NAME := tiwlan_drv
WIFI_FIRMWARE_LOADER := wlan_loader
WIFI_EXT_MODULE_PATH := /system/lib/modules/sdio.ko
WIFI_EXT_MODULE_NAME := sdio
PRODUCT_DEFAULT_WIFI_CHANNELS := 14

# EGL
BOARD_EGL_CFG := device/semc/robyn/prebuilt/egl.cfg
COMMON_GLOBAL_CFLAGS += -DEGL_TRACE

# Libaudio
TARGET_PROVIDES_LIBAUDIO := true
BOARD_COMBO_DEVICE_SUPPORTED := true
TARGET_USE_SOFTWARE_AUDIO_AAC := true

# Libaudio ICS hack
COMMON_GLOBAL_CFLAGS += -DICS_AUDIO_BLOB
BOARD_USES_ICS_LIBAUDIO := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
#BOARD_HAVE_BLUETOOTH_CUSTOM_HCIATTACH := true
TARGET_CUSTOM_BLUEDROID := ../../../device/semc/robyn/bluedroid.c

# Ril
TARGET_PROVIDES_LIBRIL := true

# Display
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true
BOARD_AVOID_DRAW_TEXTURE_EXTENSION := true
BOARD_NO_RGBX_8888 := true
BOARD_USE_SKIA_LCDTEXT := true
TARGET_FORCE_CPU_UPLOAD := true
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
TARGET_GRALLOC_USES_ASHMEM := false
USE_OPENGL_RENDERER := true
TARGET_USES_GENLOCK := true
COMMON_GLOBAL_CFLAGS += -DQCOM_NO_SECURE_PLAYBACK
TARGET_BOOTANIMATION_USE_RGB565 := true
TARGET_BOOTANIMATION_TEXTURE_CACHE := true
BOARD_USE_SCREENCAP := true
TARGET_OVERLAY_ALWAYS_DETERMINES_FORMAT := true
COPYBIT_MSM7K := true
TARGET_NO_HW_VSYNC := true

# Fix Refrashrate
COMMON_GLOBAL_CFLAGS += -DREFRESH_RATE=60 -DQCOM_HARDWARE

# Deep Sleep fix
COMMON_GLOBAL_CFLAGS += -DFORCE_CPU_UPLOAD

# Overlay (HDMI Panel)
TARGET_USES_SF_BYPASS := false
TARGET_QCOM_HDMI_OUT := false

# GPS
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true
BOARD_USES_QCOM_GPS := true
#BOARD_USES_QCOM_LIBRPC := true
BOARD_VENDOR_QCOM_AMSS_VERSION := 1240
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := delta
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 1240

# Touchscreen
BOARD_USE_LEGACY_TOUCHSCREEN := true

# Recovery
BOARD_CUSTOM_BOOTIMG_MK := device/semc/robyn/custombootimg.mk
TARGET_RECOVERY_PRE_COMMAND := "mkdir /cache/recovery;touch /cache/recovery/boot;sync;"
BOARD_HAS_NO_MISC_PARTITION := true
BOARD_USES_RECOVERY_CHARGEMODE := false
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/semc/robyn/recovery/recovery_keys.c
BOARD_HAS_BOOT_RECOVERY := true
BOARD_HAS_SMALL_RECOVERY := true
BOARD_LDPI_RECOVERY := true

# JIT
WITH_JIT := true
ENABLE_JSC_JIT:= true

# Browser
JS_ENGINE := v8
ENABLE_WEBGL := true

# SD Mount
BOARD_UMS_LUNFILE := "/sys/devices/platform/usb_mass_storage/lun0/file"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/usb_mass_storage/lun0/file

# A custom ota package maker for a device without a boot partition
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := device/semc/robyn/releasetools/semc_ota_from_target_files
TARGET_PREBUILT_KERNEL := device/semc/robyn/prebuilt/kernel

