# build_scripts

This is the build script which builds the ACRN + Yocto SOS + Yocto UOS and Android UOS MultiOS image at https://github.com/mattcurf/meta-acrn-manifest

## Results (w/ ported https://github.com/clearlinux-pkgs/linux-iot-lts2018 kernel)
* Can successfully build and boot hypervisor and service OS
* Can successfully boot guest Linux OS
* Can see Weston desktop in both guests, with functional GVT-g demonstrated by weston-simple-egl



