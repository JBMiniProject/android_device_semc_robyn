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

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := jbmp_robyn
PRODUCT_DEVICE := robyn
PRODUCT_MODEL := E10i

TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_KERNEL):kernel

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

#recovery resources
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

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct..xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

# proprietary side of the device
$(call inherit-product-if-exists, device/semc/robyn/robyn-vendor.mk)

# Sensors + Lights
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/lights.default.so:system/lib/hw/lights.default.so \
    $(LOCAL_PATH)/prebuilt/lights.delta.so:system/lib/hw/lights.delta.so \
    $(LOCAL_PATH)/prebuilt/sensors.delta.so:system/lib/hw/sensors.delta.so \
    $(LOCAL_PATH)/prebuilt/sensors.goldfish.so:system/lib/hw/sensors.goldfish.so

# Vold
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/vold.fstab:system/etc/vold.fstab

# Updater script
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/update-binary:obj/EXECUTABLES/updater_intermediates/updater

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf

# MediaProfiles configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/media_profiles.xml:system/etc/media_profiles.xml

# Crappy headset files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/headset/AudioFilter.csv:system/etc/AudioFilter.csv \
    $(LOCAL_PATH)/prebuilt/headset/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    $(LOCAL_PATH)/prebuilt/headset/hal_seport.default.so:system/lib/hw/hal_seport.default.so \
    $(LOCAL_PATH)/prebuilt/headset/libaudioeq.so:system/lib/libaudioeq.so \
    $(LOCAL_PATH)/prebuilt/headset/libsystemconnector_hal_jni.so:system/lib/libsystemconnector_hal_jni.so \
    $(LOCAL_PATH)/prebuilt/headset/libuinputdevicejni.so:system/lib/libsystemconnector/libuinputdevicejni.so \
    $(LOCAL_PATH)/prebuilt/headset/systemconnector.kcm.bin:system/usr/keychars/systemconnector.kcm.bin \
    $(LOCAL_PATH)/prebuilt/headset/systemconnector.kl:system/usr/keylayout/systemconnector.kl \
    $(LOCAL_PATH)/prebuilt/headset/SystemConnector.apk:system/app/SystemConnector.apk

# WiFi files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/wlan/10dnsconf:system/etc/init.d/10dnsconf \
    $(LOCAL_PATH)/prebuilt/wlan/10hostapconf:system/etc/init.d/10hostapconf \
    $(LOCAL_PATH)/prebuilt/wlan/dhcpcd:system/bin/dhcpcd \
    $(LOCAL_PATH)/prebuilt/wlan/dnsmasq.conf:system/etc/wifi/dnsmasq.conf \
    $(LOCAL_PATH)/prebuilt/wlan/hostapd.conf:system/etc/wifi/softap/hostapd.conf \
    $(LOCAL_PATH)/prebuilt/wlan/tiap_cu:system/bin/tiap_cu \
    $(LOCAL_PATH)/prebuilt/wlan/tiap_loader:system/bin/tiap_loader \
    $(LOCAL_PATH)/prebuilt/wlan/tiap_loader.sh:system/bin/tiap_loader.sh \
    $(LOCAL_PATH)/prebuilt/wlan/tiwlan.ini:system/etc/wifi/tiwlan.ini \
    $(LOCAL_PATH)/prebuilt/wlan/tiwlan_ap.ini:system/etc/wifi/softap/tiwlan_ap.ini \
    $(LOCAL_PATH)/prebuilt/wlan/tiwlan_firmware.bin:system/etc/wifi/tiwlan_firmware.bin \
    $(LOCAL_PATH)/prebuilt/wlan/tiwlan_firmware_ap.bin:system/etc/wifi/softap/tiwlan_firmware_ap.bin \
    $(LOCAL_PATH)/prebuilt/wlan/wlan_cu:system/bin/wlan_cu \
    $(LOCAL_PATH)/prebuilt/wlan/wlan_loader:system/bin/wlan_loader

# Audio
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/audio_policy.delta.so:system/lib/hw/audio_policy.delta.so \
    $(LOCAL_PATH)/prebuilt/audio.primary.delta.so:system/lib/hw/audio.primary.delta.so \
    $(LOCAL_PATH)/prebuilt/media_codecs.xml:system/etc/media_codecs.xml

PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.delta \
    audio_policy.delta \
    libaudioutils

# OpenSSH
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh
	
# Misc
+PRODUCT_PACKAGES += \
     com.android.future.usb.accessory \
     make_ext4fs \
     setup_fs

# Bugmailer
PRODUCT_PACKAGES += \
    send_bug

PRODUCT_COPY_FILES += \
    system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
    system/extras/bugmailer/send_bug:system/bin/send_bug

# Ramdisk files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/init.delta.usb.rc:root/init.delta.usb.rc

PRODUCT_PACKAGES += \
    gralloc.default \
    gralloc.msm7x27 \
    hwcomposer.default \
    hwcomposer.msm7x27 \
    copybit.msm7x27 \
    gps.delta \
    lights.delta \
    sensors.delta \
    camera.msm7x27 \
    libgenlock \
    libmemalloc \
    libtilerenderer \
    libQcomUI \
    liboverlay

PRODUCT_LOCALES += \
 		ldpi \
		mdpi

# Omx
PRODUCT_PACKAGES += \
    libmm-omxcore \
    libdivxdrmdecrypt \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw \
    libopencorehw

# Extra Packages
PRODUCT_PACKAGES += \
    FileManager \
    LegacyCamera \
    screencap \
    Provision \
    Trebuchet

# Hciattach
PRODUCT_COPY_FILES += \
    device/semc/robyn/prebuilt/hciattach:system/bin/hciattach

# A2SD
PRODUCT_COPY_FILES += \
    device/semc/robyn/prebuilt/a2sd:system/bin/a2sd \
    device/semc/robyn/prebuilt/10apps2sd:system/etc/init.d/10apps2sd \
    device/semc/robyn/prebuilt/05mountext:system/etc/init.d/05mountext \
    device/semc/robyn/prebuilt/04modules:system/etc \
    device/semc/robyn/prebuilt/zipalign:system/xbin/zipalign

# for compcache
PRODUCT_COPY_FILES += \
        device/semc/robyn/prebuilt/rzscontrol:system/xbin/rzscontrol

# FM Radio
PRODUCT_PACKAGES += \
    hciattach \
    com.ti.fm.fmreceiverif.xml \
    fmreceiverif \
    Fmapplication \
    libfmrx \
    libfm_stack \
    FmRxService

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise
