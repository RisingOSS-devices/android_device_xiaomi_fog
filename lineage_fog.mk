# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from common lineage configuration
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from fog device
$(call inherit-product, device/xiaomi/fog/device.mk)

# Device identifier
PRODUCT_NAME := lineage_fog
PRODUCT_DEVICE := fog
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi 10C
PRODUCT_MANUFACTURER := Xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

BUILD_FINGERPRINT := Redmi/fog_global/fog:13/TKQ1.221114.001/V14.0.2.0.TGEMIXM:user/release-keys

# Rising stuff
RISING_CHIPSET := SM6225
RISING_MAINTAINER := Notkerd

WITH_GMS := false
TARGET_CORE_GMS := false

# Aperture Camera
TARGET_BUILD_APERTURE_CAMERA := true

# Target
TARGET_BOOT_ANIMATION_RES := 720
TARGET_SUPPORTS_QUICK_TAP := true
