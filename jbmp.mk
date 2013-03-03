## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common jbmp stuff.
$(call inherit-product, vendor/jbmp/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/semc/robyn/robyn.mk)

# Setup device configuration
PRODUCT_RELEASE_NAME := E10i
PRODUCT_DEVICE := robyn
PRODUCT_NAME := jbmp_robyn
PRODUCT_BRAND := SEMC
PRODUCT_MODEL := E10i
PRODUCT_MANUFACTURER := Sony Ericsson

# Release data
PRODUCT_VERSION_DEVICE_SPECIFIC := 2
TARGET_NO_LIVEWALLPAPERS := false
TARGET_BOOTANIMATION_NAME := vertical-240x320
TARGET_INCLUDE_GAPPS := true
TARGET_USES_SRS := true

# Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=LT30p_1269-0608 BUILD_FINGERPRINT=Sony/LT30p_1269-0608/LT30p:4.0.4/7.0.A.3.195/PPP_xw:user/release-keys PRIVATE_BUILD_DESC="LT30p-user 4.0.4 7.0.A.3.195 PPP_xw test-keys"
