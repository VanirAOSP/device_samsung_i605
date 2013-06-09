#
# Copyright (C) 2012 The CyanogenMod Project
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

LOCAL_PATH := device/samsung/i605

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/init.smdk4x12.rc:root/init.smdk4x12.rc \
    $(LOCAL_PATH)/rootdir/init.smdk4x12.usb.rc:root/init.smdk4x12.usb.rc \
    $(LOCAL_PATH)/rootdir/ueventd.smdk4x12.rc:root/ueventd.smdk4x12.rc \
    $(LOCAL_PATH)/rootdir/lpm.rc:root/lpm.rc \
    $(LOCAL_PATH)/rootdir/ueventd.smdk4x12.rc:recovery/root/ueventd.smdk4x12.rc \
    $(LOCAL_PATH)/rootdir/fstab.smdk4x12:root/fstab.smdk4x12

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/nvram_net.txt:system/etc/wifi/nvram_net.txt

PRODUCT_PACKAGES += \
    VZWAPNLib \
    vzwapnpermission \
    VZWAPNService

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/vzwapnlib.xml:system/etc/permissions/vzwapnlib.xml \
    $(LOCAL_PATH)/configs/com.verizon.hardware.telephony.xml:system/etc/permissions/com.verizon.hardware.telephony.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.qc_lte_network_modes=true

# Include common makefile
$(call inherit-product, device/samsung/t0lte/common.mk)

$(call inherit-product-if-exists, vendor/samsung/t0ltecdma/t0ltecdma-vendor.mk)
