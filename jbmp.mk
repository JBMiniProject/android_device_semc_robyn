## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common JBMiniProject and CM stuff.
$(call inherit-product, vendor/jbmp/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/semc/robyn/robyn.mk)

# Setup device configuration
PRODUCT_RELEASE_NAME := X10 Mini
PRODUCT_DEVICE := robyn
PRODUCT_NAME := jbmp_robyn
PRODUCT_BRAND := SEMC
PRODUCT_MODEL := X10 Mini
PRODUCT_MANUFACTURER := Sony Ericsson

# Release data
PRODUCT_VERSION_DEVICE_SPECIFIC := 2
TARGET_NO_LIVEWALLPAPERS := false
TARGET_BOOTANIMATION_NAME := vertical-240x320
TARGET_INCLUDE_GAPPS := true

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=E10i
