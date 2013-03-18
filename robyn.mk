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

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

-include device/semc/msm7x27-common/msm7x27.mk

# Discard inherited values and use our own instead.
PRODUCT_NAME := robyn
PRODUCT_DEVICE := robyn
PRODUCT_MODEL := E10i

# Boot files
ifeq ($(TARGET_PREBUILT_KERNEL),)
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
endif

# Recovery resources
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/res/images/icon_firmware_error.png:recovery/root/res/images/icon_firmware_error.png \
    $(LOCAL_PATH)/recovery/res/images/icon_firmware_install.png:recovery/root/res/images/icon_firmware_install.png \
    $(LOCAL_PATH)/recovery/res/images/icon_clockwork.png:recovery/root/res/images/icon_clockwork.png \
    $(LOCAL_PATH)/recovery/res/images/icon_error.png:recovery/root/res/images/icon_error.png \
    $(LOCAL_PATH)/recovery/res/images/icon_installing.png:recovery/root/res/images/icon_installing.png \
    $(LOCAL_PATH)/recovery/res/images/icon_installing_overlay01.png:recovery/root/res/images/icon_installing_overlay01.png \
    $(LOCAL_PATH)/recovery/res/images/icon_installing_overlay02.png:recovery/root/res/images/icon_installing_overlay02.png \
    $(LOCAL_PATH)/recovery/res/images/icon_installing_overlay03.png:recovery/root/res/images/icon_installing_overlay03.png \
    $(LOCAL_PATH)/recovery/res/images/icon_installing_overlay04.png:recovery/root/res/images/icon_installing_overlay04.png \
    $(LOCAL_PATH)/recovery/res/images/icon_installing_overlay05.png:recovery/root/res/images/icon_installing_overlay05.png \
    $(LOCAL_PATH)/recovery/res/images/icon_installing_overlay06.png:recovery/root/res/images/icon_installing_overlay06.png \
    $(LOCAL_PATH)/recovery/res/images/icon_installing_overlay07.png:recovery/root/res/images/icon_installing_overlay07.png \
    $(LOCAL_PATH)/recovery/res/images/indeterminate01.png:recovery/root/res/images/indeterminate01.png \
    $(LOCAL_PATH)/recovery/res/images/indeterminate02.png:recovery/root/res/images/indeterminate02.png \
    $(LOCAL_PATH)/recovery/res/images/indeterminate03.png:recovery/root/res/images/indeterminate03.png \
    $(LOCAL_PATH)/recovery/res/images/indeterminate04.png:recovery/root/res/images/indeterminate04.png \
    $(LOCAL_PATH)/recovery/res/images/indeterminate05.png:recovery/root/res/images/indeterminate05.png \
    $(LOCAL_PATH)/recovery/res/images/indeterminate06.png:recovery/root/res/images/indeterminate06.png \
    $(LOCAL_PATH)/recovery/res/images/progress_empty.png:recovery/root/res/images/progress_empty.png \
    $(LOCAL_PATH)/recovery/res/images/progress_fill.png:recovery/root/res/images/progress_fill.png \
    $(LOCAL_PATH)/recovery/res/images/stitch.png:recovery/root/res/images/stitch.png

# Robyn uses low-density artwork where available
PRODUCT_AAPT_CONFIG := normal ldpi mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_LOCALES += \
 		ldpi \
		mdpi

# Prebuilt Binaries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/app/Torch.apk:system/app/Torch.apk \
    $(LOCAL_PATH)/prebuilt/bin/akmd2:system/bin/akmd2 \
    $(LOCAL_PATH)/prebuilt/bin/chargemon:system/bin/chargemon \
    $(LOCAL_PATH)/prebuilt/bin/semc_chargalg:system/bin/semc_chargalg \
    $(LOCAL_PATH)/prebuilt/etc/media_profiles.xml:/system/etc/media_profiles.xml \
    $(LOCAL_PATH)/prebuilt/etc/sensors.conf:system/etc/sensors.conf \
    $(LOCAL_PATH)/prebuilt/etc/semc/chargemon/anim1.rle:system/etc/semc/chargemon/anim1.rle \
    $(LOCAL_PATH)/prebuilt/etc/semc/chargemon/anim2.rle:system/etc/semc/chargemon/anim2.rle \
    $(LOCAL_PATH)/prebuilt/etc/semc/chargemon/anim3.rle:system/etc/semc/chargemon/anim3.rle \
    $(LOCAL_PATH)/prebuilt/etc/semc/chargemon/anim4.rle:system/etc/semc/chargemon/anim4.rle \
    $(LOCAL_PATH)/prebuilt/etc/semc/chargemon/anim5.rle:system/etc/semc/chargemon/anim5.rle \
    $(LOCAL_PATH)/prebuilt/etc/semc/chargemon/anim6.rle:system/etc/semc/chargemon/anim6.rle \
    $(LOCAL_PATH)/prebuilt/etc/semc/chargemon/anim7.rle:system/etc/semc/chargemon/anim7.rle \
    $(LOCAL_PATH)/prebuilt/etc/semc/chargemon/anim8.rle:system/etc/semc/chargemon/anim8.rle \
    $(LOCAL_PATH)/prebuilt/etc/tiwlan.ini:system/etc/tiwlan.ini \
    $(LOCAL_PATH)/prebuilt/framework/com.dsi.ant.antradio_library.jar:system/framework/com.dsi.ant.antradio_library.jar \
    $(LOCAL_PATH)/prebuilt/lib/libaudioeq.so:system/lib/libaudioeq.so \
	$(LOCAL_PATH)/prebuilt/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    $(LOCAL_PATH)/prebuilt/usr/keychars/robyn_keypad.kcm.bin:system/usr/keychars/robyn_keypad.kcm.bin \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/robyn_keypad.kl:system/usr/keylayout/robyn_keypad.kl