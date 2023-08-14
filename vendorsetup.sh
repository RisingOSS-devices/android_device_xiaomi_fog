# ROM source patches

color="\033[0;32m"
end="\033[0m"

echo -e "${color}Applying patches${end}"
sleep 1

echo -e "${blue}Sync required dependencies${blue}"
#sync Hardware tree
rm -rf hardware/xiaomi
git clone https://github.com/PixelExperience/hardware_xiaomi.git hardware/xiaomi

#Sync to vendor qcom opensource interfaces
rm -rf vendor/qcom/opensource/interfaces
git clone https://github.com/PixelExperience/vendor_qcom_opensource_interfaces.git vendor/qcom/opensource/interfaces

#Sync to vendor qcom opensource fm-commonsys
rm -rf vendor/qcom/opensource/fm-commonsys
git clone https://github.com/PixelExperience/vendor_qcom_opensource_fm-commonsys.git vendor/qcom/opensource/fm-commonsys

#Sync to vendor qcom data-ipa-cfg-mgr-legacy-um
rm -rf vendor/qcom/opensource/data-ipa-cfg-mgr-legacy-um
git clone https://github.com/PixelExperience/vendor_qcom_opensource_data-ipa-cfg-mgr-legacy-um.git vendor/qcom/opensource/data-ipa-cfg-mgr-legacy-um

#sync pe settings
rm -rf packages/resources/devicesettings
git clone https://github.com/parixxshit/android_packages_resources_devicesettings.git packages/resources/devicesettings

#sync vendor_qcom_opensource_audio
git clone https://github.com/PixelExperience/vendor_qcom_opensource_audio.git vendor/qcom/opensource/audio

#sync miui-camera
git clone https://github.com/PixelExperience-Devices/device_xiaomi_sm6225-common-miuicamera.git device/xiaomi/sm6225-common-miuicamera
git clone https://gitlab.pixelexperience.org/android/vendor-blobs/vendor_xiaomi_sm6225-common-miuicamera.git vendor/xiaomi/sm6225-common-miuicamera
echo -e "${color}Finished sync!${end}"
