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

# Sensors + Lights
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/lights.default.so:system/lib/hw/lights.default.so \
    $(LOCAL_PATH)/prebuilt/lights.delta.so:system/lib/hw/lights.delta.so \
    $(LOCAL_PATH)/prebuilt/sensors.delta.so:system/lib/hw/sensors.delta.so \
    $(LOCAL_PATH)/prebuilt/sensors.goldfish.so:system/lib/hw/sensors.goldfish.so

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
    device/semc/robyn/prebuilt/etc/firmware/fmc_init_1273.1.bts:system/etc/firmware/fmc_init_1273.1.bts \
    device/semc/robyn/prebuilt/etc/firmware/fmc_init_1273.2.bts:system/etc/firmware/fmc_init_1273.2.bts \
    device/semc/robyn/prebuilt/etc/firmware/fm_rx_init_1273.1.bts:system/etc/firmware/fm_rx_init_1273.1.bts \
    device/semc/robyn/prebuilt/etc/firmware/fm_rx_init_1273.2.bts:system/etc/firmware/fm_rx_init_1273.2.bts \
    device/semc/robyn/prebuilt/etc/firmware/fm_tx_init_1273.1.bts:system/etc/firmware/fm_tx_init_1273.1.bts \
    device/semc/robyn/prebuilt/etc/firmware/fm_tx_init_1273.2.bts:system/etc/firmware/fm_tx_init_1273.2.bts \
    device/semc/robyn/prebuilt/etc/firmware/TIInit_7.2.31.bts:system/etc/firmware/TIInit_7.2.31.bts \
    device/semc/robyn/prebuilt/etc/semc/chargemon/anim1.rle:system/etc/semc/chargemon/anim1.rle \
    device/semc/robyn/prebuilt/etc/semc/chargemon/anim2.rle:system/etc/semc/chargemon/anim2.rle \
    device/semc/robyn/prebuilt/etc/semc/chargemon/anim3.rle:system/etc/semc/chargemon/anim3.rle \
    device/semc/robyn/prebuilt/etc/semc/chargemon/anim4.rle:system/etc/semc/chargemon/anim4.rle \
    device/semc/robyn/prebuilt/etc/semc/chargemon/anim5.rle:system/etc/semc/chargemon/anim5.rle \
    device/semc/robyn/prebuilt/etc/semc/chargemon/anim6.rle:system/etc/semc/chargemon/anim6.rle \
    device/semc/robyn/prebuilt/etc/semc/chargemon/anim7.rle:system/etc/semc/chargemon/anim7.rle \
    device/semc/robyn/prebuilt/etc/semc/chargemon/anim8.rle:system/etc/semc/chargemon/anim8.rle \
    device/semc/robyn/prebuilt/etc/sensors.conf:system/etc/sensors.conf \
    device/semc/robyn/prebuilt/lib/libauth.so:system/lib/libauth.so \
    device/semc/robyn/prebuilt/lib/libcamera.so:system/lib/libcamera.so \
    device/semc/robyn/prebuilt/lib/libcm.so:system/lib/libcm.so \
    device/semc/robyn/prebuilt/lib/libdiag.so:system/lib/libdiag.so \
    device/semc/robyn/prebuilt/lib/libdll.so:system/lib/libdll.so \
    device/semc/robyn/prebuilt/lib/libdsm.so:system/lib/libdsm.so \
    device/semc/robyn/prebuilt/lib/libdss.so:system/lib/libdss.so \
    device/semc/robyn/prebuilt/lib/libgsdi_exp.so:system/lib/libgsdi_exp.so \
    device/semc/robyn/prebuilt/lib/libgstk_exp.so:system/lib/libgstk_exp.so \
    device/semc/robyn/prebuilt/lib/libmiscta.so:system/lib/libmiscta.so \
    device/semc/robyn/prebuilt/lib/libmm-adspsvc.so:system/lib/libmm-adspsvc.so \
    device/semc/robyn/prebuilt/lib/libmmgsdilib.so:system/lib/libmmgsdilib.so \
    device/semc/robyn/prebuilt/lib/libmmipl.so:system/lib/libmmipl.so \
    device/semc/robyn/prebuilt/lib/libmmjpeg.so:system/lib/libmmjpeg.so \
    device/semc/robyn/prebuilt/lib/libmm-omxcore.so:system/lib/libmm-omxcore.so \
    device/semc/robyn/prebuilt/lib/libnv.so:system/lib/libnv.so \
    device/semc/robyn/prebuilt/lib/liboemcamera.so:system/lib/liboemcamera.so \
    device/semc/robyn/prebuilt/lib/liboem_rapi.so:system/lib/liboem_rapi.so \
    device/semc/robyn/prebuilt/lib/libOmxAacDec.so:system/lib/libOmxAacDec.so \
    device/semc/robyn/prebuilt/lib/libOmxAacEnc.so:system/lib/libOmxAacEnc.so \
    device/semc/robyn/prebuilt/lib/libOmxAmrDec.so:system/lib/libOmxAmrDec.so \
    device/semc/robyn/prebuilt/lib/libOmxAmrEnc.so:system/lib/libOmxAmrEnc.so \
    device/semc/robyn/prebuilt/lib/libOmxAmrRtpDec.so:system/lib/libOmxAmrRtpDec.so \
    device/semc/robyn/prebuilt/lib/libOmxAmrwbDec.so:system/lib/libOmxAmrwbDec.so \
    device/semc/robyn/prebuilt/lib/libOmxEvrcDec.so:system/lib/libOmxEvrcDec.so \
    device/semc/robyn/prebuilt/lib/libOmxEvrcEnc.so:system/lib/libOmxEvrcEnc.so \
    device/semc/robyn/prebuilt/lib/libOmxH264Dec.so:system/lib/libOmxH264Dec.so \
    device/semc/robyn/prebuilt/lib/libOmxMp3Dec.so:system/lib/libOmxMp3Dec.so \
    device/semc/robyn/prebuilt/lib/libOmxMpeg4Dec.so:system/lib/libOmxMpeg4Dec.so \
    device/semc/robyn/prebuilt/lib/libOmxQcelp13Enc.so:system/lib/libOmxQcelp13Enc.so \
    device/semc/robyn/prebuilt/lib/libOmxQcelpDec.so:system/lib/libOmxQcelpDec.so \
    device/semc/robyn/prebuilt/lib/libOmxVidEnc.so:system/lib/libOmxVidEnc.so \
    device/semc/robyn/prebuilt/lib/libOmxWmaDec.so:system/lib/libOmxWmaDec.so \
    device/semc/robyn/prebuilt/lib/libOmxWmvDec.so:system/lib/libOmxWmvDec.so \
    device/semc/robyn/prebuilt/lib/liboncrpc.so:system/lib/liboncrpc.so \
    device/semc/robyn/prebuilt/lib/libopencore_common.so:system/lib/libopencore_common.so \
    device/semc/robyn/prebuilt/lib/libpbmlib.so:system/lib/libpbmlib.so \
    device/semc/robyn/prebuilt/lib/libqmi.so:system/lib/libqmi.so \
    device/semc/robyn/prebuilt/lib/libqueue.so:system/lib/libqueue.so \
    device/semc/robyn/prebuilt/lib/librpc.so:system/lib/librpc.so \
    device/semc/robyn/prebuilt/lib/libril.so:system/lib/libril.so \
    device/semc/robyn/prebuilt/lib/libsemc_ril.so:system/lib/libsemc_ril.so \
    device/semc/robyn/prebuilt/lib/libuim.so:system/lib/libuim.so \
    device/semc/robyn/prebuilt/lib/libwms.so:system/lib/libwms.so \
    device/semc/robyn/prebuilt/lib/libwmsts.so:system/lib/libwmsts.so \
    device/semc/robyn/prebuilt/framework/com.dsi.ant.antradio_library.jar:system/framework/com.dsi.ant.antradio_library.jar \
    device/semc/robyn/prebuilt/lib/libaudioeq.so:system/lib/libaudioeq.so \
    device/semc/robyn/prebuilt/usr/keychars/robyn_keypad.kcm.bin:system/usr/keychars/robyn_keypad.kcm.bin \
    device/semc/robyn/prebuilt/usr/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/semc/robyn/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/semc/robyn/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/semc/robyn/prebuilt/usr/keylayout/robyn_keypad.kl:system/usr/keylayout/robyn_keypad.kl
