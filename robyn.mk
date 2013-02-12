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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# Inherit from the common version
-include device/semc/msm7x27-common/msm7x27.mk

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := jbmp_robyn
PRODUCT_DEVICE := robyn
PRODUCT_MODEL := E10i

# Boot files
ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
endif

# media configuration xml file
PRODUCT_COPY_FILES += \
    device/semc/robyn/prebuilt/media_profiles.xml:/system/etc/media_profiles.xml

# Wifi firmware
PRODUCT_COPY_FILES += \
    device/semc/robyn/prebuilt/wlan/tiwlan.ini:system/etc/wifi/tiwlan.ini \
    device/semc/robyn/prebuilt/wlan/tiwlan_ap.ini:system/etc/wifi/softap/tiwlan_ap.ini

# Recovery resources
PRODUCT_COPY_FILES += \
    device/semc/robyn/recovery/res/images/icon_firmware_error.png:recovery/root/res/images/icon_firmware_error.png \
    device/semc/robyn/recovery/res/images/icon_firmware_install.png:recovery/root/res/images/icon_firmware_install.png \
    device/semc/robyn/recovery/res/images/icon_clockwork.png:recovery/root/res/images/icon_clockwork.png \
    device/semc/robyn/recovery/res/images/icon_error.png:recovery/root/res/images/icon_error.png \
    device/semc/robyn/recovery/res/images/icon_installing.png:recovery/root/res/images/icon_installing.png \
    device/semc/robyn/recovery/res/images/icon_installing_overlay01.png:recovery/root/res/images/icon_installing_overlay01.png \
    device/semc/robyn/recovery/res/images/icon_installing_overlay02.png:recovery/root/res/images/icon_installing_overlay02.png \
    device/semc/robyn/recovery/res/images/icon_installing_overlay03.png:recovery/root/res/images/icon_installing_overlay03.png \
    device/semc/robyn/recovery/res/images/icon_installing_overlay04.png:recovery/root/res/images/icon_installing_overlay04.png \
    device/semc/robyn/recovery/res/images/icon_installing_overlay05.png:recovery/root/res/images/icon_installing_overlay05.png \
    device/semc/robyn/recovery/res/images/icon_installing_overlay06.png:recovery/root/res/images/icon_installing_overlay06.png \
    device/semc/robyn/recovery/res/images/icon_installing_overlay07.png:recovery/root/res/images/icon_installing_overlay07.png \
    device/semc/robyn/recovery/res/images/indeterminate01.png:recovery/root/res/images/indeterminate01.png \
    device/semc/robyn/recovery/res/images/indeterminate02.png:recovery/root/res/images/indeterminate02.png \
    device/semc/robyn/recovery/res/images/indeterminate03.png:recovery/root/res/images/indeterminate03.png \
    device/semc/robyn/recovery/res/images/indeterminate04.png:recovery/root/res/images/indeterminate04.png \
    device/semc/robyn/recovery/res/images/indeterminate05.png:recovery/root/res/images/indeterminate05.png \
    device/semc/robyn/recovery/res/images/indeterminate06.png:recovery/root/res/images/indeterminate06.png \
    device/semc/robyn/recovery/res/images/progress_empty.png:recovery/root/res/images/progress_empty.png \
    device/semc/robyn/recovery/res/images/progress_fill.png:recovery/root/res/images/progress_fill.png \
    device/semc/robyn/recovery/res/images/stitch.png:recovery/root/res/images/stitch.png

# Torch
PRODUCT_PACKAGES += \
    Torch

# Touchsceen
PRODUCT_COPY_FILES += \
    device/semc/robyn/prebuilt/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc

# Robyn uses low-density artwork where available
PRODUCT_AAPT_CONFIG := normal ldpi mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

PRODUCT_LOCALES += \
 		ldpi \
		mdpi

# LCD Density
PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=120

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Prebuilt Binaries
PRODUCT_COPY_FILES += \
    device/semc/robyn/prebuilt/app/Torch.apk:system/app/Torch.apk \
    device/semc/robyn/prebuilt/bin/akmd2:system/bin/akmd2 \
    device/semc/robyn/prebuilt/bin/chargemon:system/bin/chargemon \
    device/semc/robyn/prebuilt/bin/inputattach:system/bin/inputattach \
    device/semc/robyn/prebuilt/bin/nvimport:system/bin/nvimport \
    device/semc/robyn/prebuilt/bin/port-bridge:system/bin/port-bridge \
    device/semc/robyn/prebuilt/bin/qmuxd:system/bin/qmuxd \
    device/semc/robyn/prebuilt/bin/semc_chargalg:system/bin/semc_chargalg \
    device/semc/robyn/prebuilt/bin/slidercounter:system/bin/slidercounter \
    device/semc/robyn/prebuilt/bin/updatemiscta:system/bin/updatemiscta \
    device/semc/robyn/prebuilt/bin/rild:system/bin/rild \
    device/semc/robyn/prebuilt/bin/tiap_cu:system/bin/tiap_cu \
    device/semc/robyn/prebuilt/bin/tiap_loader:system/bin/tiap_loader \
    device/semc/robyn/prebuilt/framework/com.dsi.ant.antradio_library.jar:system/framework/com.dsi.ant.antradio_library.jar \
    device/semc/robyn/prebuilt/lib/libaudioeq.so:system/lib/libaudioeq.so \
    device/semc/robyn/prebuilt/usr/keychars/robyn_keypad.kcm.bin:system/usr/keychars/robyn_keypad.kcm.bin \
    device/semc/robyn/prebuilt/usr/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/semc/robyn/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/semc/robyn/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/semc/robyn/prebuilt/usr/keylayout/robyn_keypad.kl:system/usr/keylayout/robyn_keypad.kl
