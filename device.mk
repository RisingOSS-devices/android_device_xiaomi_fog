# Copyright (C) 2022 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# APEX's
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Include GSI
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/android_t_baseline.mk)
PRODUCT_VIRTUAL_AB_COMPRESSION_METHOD := gz

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# API Level
PRODUCT_SHIPPING_API_LEVEL := 30

# Attestation
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml

# Audio
BOARD_SUPPORTS_OPENSOURCE_STHAL := true

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/audio_policy_configuration.xml \
    $(LOCAL_PATH)/configs/audio/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
	$(LOCAL_PATH)/configs/audio/mixer_paths_bengal_idp.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_idp_india.xml

PRODUCT_PACKAGES += \
    android.hardware.audio.service

# Bluetooth
TARGET_USE_QTI_BT_STACK := false

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 1650
TARGET_SCREEN_WIDTH := 720


# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl-qti \
    android.hardware.boot@1.2-impl-qti.recovery \
    android.hardware.boot@1.2-service

# Camera
$(call inherit-product-if-exists, device/xiaomi/fog-miuicamera/config.mk)

PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service_64 \
    libcamera2ndk_vendor \
	libpiex_shim \
    libdng_sdk.vendor \
    libstdc++.vendor \
    vendor.qti.hardware.camera.device@1.0.vendor \
    vendor.qti.hardware.camera.postproc@1.0.vendor

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/camera/camxoverridesettings.txt:$(TARGET_COPY_OUT_VENDOR)/etc/camera/camxoverridesettings.txt

# Charger
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/vendor.qti.hardware.charger_monitor@1.0-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/vendor.qti.hardware.charger_monitor@1.0-service.rc

# Device Settings
PRODUCT_PACKAGES += \
    XiaomiParts

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/parts/privapp-permissions-parts.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-parts.xml

# Dex/ART optimization
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false
PRODUCT_DEX_PREOPT_DEFAULT_COMPILER_FILTER := everything
USE_DEX2OAT_DEBUG := false

# Display
TARGET_USE_QCOM_OFFSET := true

PRODUCT_PACKAGES += \
    android.frameworks.displayservice@1.0.vendor \
    libdisplayconfig.qti

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4.vendor \
    android.hardware.drm-service.clearkey

# Enable Dynamic partition
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Fastboot
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.xiaomi

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# FM
BOARD_HAVE_QCOM_FM := true

# Graphics
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2020-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/flp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/flp.conf \
    $(LOCAL_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_VENDOR)/etc/gps.conf \
    $(LOCAL_PATH)/configs/gps/sap.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sap.conf

# IDC
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/idc/,$(TARGET_COPY_OUT_VENDOR)/usr/idc)

# Keylayout
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/keylayout/,$(TARGET_COPY_OUT_VENDOR)/usr/keylayout)

# Kernel
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)-kernel/kernel

PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_KERNEL):kernel \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)-kernel/vendor-modules,$(TARGET_COPY_OUT_VENDOR)/lib/modules)

PRODUCT_VENDOR_KERNEL_HEADERS += $(LOCAL_PATH)-kernel/kernel-headers

# Neural Networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \
    com.android.nfc_extras \
    libchrome.vendor \
    NfcNci \
    SecureElement \
    Tag

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/nfc/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/com.nxp.mifare.xml

# Overlays
PRODUCT_PACKAGES += \
    FogCarrierConfigOverlay \
    FogFrameworksOverlay \
    FogSettingsOverlay \
    FogSystemUIOverlay \
    FogWifiOverlay \
    SettingsProvider220333QAGOverlay \
    SettingsProvider220333QLOverlay \
    SettingsProvider220333QBIOverlay \
    SettingsProvider220333QNYOverlay

# Perf
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/perf/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf \
    $(LOCAL_PATH)/configs/perf/perfboostsconfig.xml:$(TARGET_COPY_OUT_VENDOR)/etc/perf/perfboostsconfig.xml \
    $(LOCAL_PATH)/configs/perf/perfconfigstore.xml:$(TARGET_COPY_OUT_VENDOR)/etc/perf/perfconfigstore.xml

# Public libraries
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# Rootdir / Init files
PRODUCT_PACKAGES += \
    init.goodix.events.sh \
    init.qti.dcvs.sh \
    init.qti.early_init.sh

PRODUCT_PACKAGES += \
    fstab.qcom \
    fstab.qcom_ramdisk \
    fstab.zram \
    init.fog.rc \
    init.fog.perf.rc \
    init.target.rc \
    init.xiaomi.fingerprint.rc \
    init.xiaomi.rc \
    ueventd.xiaomi.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/init.recovery.qcom.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.qcom.rc

# qcom/common tree
$(call inherit-product, device/qcom/common/common.mk)
TARGET_BOARD_PLATFORM := bengal
TARGET_USE_BENGAL_HALS := true
TARGET_USES_PN5XX_HAL := true

TARGET_COMMON_QTI_COMPONENTS := \
    alarm \
    audio \
    av \
    bt \
    charging \
    display \
    dsprpcd \
    gps \
    init \
    keymaster \
    media \
    overlay \
    perf \
    telephony \
    usb \
    vibrator \
    wfd \
    wlan

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.0-ScopedWakelock.vendor \
    android.hardware.sensors@2.1-service.xiaomi-multihal \
    android.frameworks.sensorservice@1.0 \
    android.frameworks.sensorservice@1.0.vendor \
    libsensorndkbridge

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/qcom-caf/bootctrl \
    hardware/xiaomi

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true

# Update Engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# USB
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/init.qcom.usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.qcom.usb.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init/init.mi.usb.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.mi.usb.sh \
    $(LOCAL_PATH)/init/init.qcom.usb.sh:$(TARGET_COPY_OUT_VENDOR)/bin/init.qcom.usb.sh

ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_VENDOR_PROPERTIES += \
    persist.vendor.usb.config=mtp,adb
endif

# Verified Boot
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# VNDK
PRODUCT_EXTRA_VNDK_VERSIONS := 30

# VNDK
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v32/arm64/arch-arm64-armv8-a/shared/vndk-sp/libhidlbase.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libhidlbase-v32.so

# WiFi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini

# WiFi Display
PRODUCT_PACKAGES += \
    libwfdaac_vendor:32

# Inherit from vendor
$(call inherit-product, vendor/xiaomi/fog/fog-vendor.mk)
