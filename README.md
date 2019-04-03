# build_scripts

This is the build script which builds the ACRN + Yocto SOS + Yocto UOS and Android UOS MultiOS image at https://github.com/mattcurf/meta-acrn-manifest

## Results
* Can successfully build and boot hypervisor and service OS
* Can successfully boot guest Linux OS
  * guest networking not functional through service OS tap device
* Can't boot Android guest OS; system hangs
* Can not see weston screen on either service OS or guest OS
* System is not stable; will reboot 120 secods due to hung kernel task


