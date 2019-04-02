#!/bin/bash

git config --global user.email "builder@user.com"
git config --global user.name "builder"
git config --global color.ui false

mkdir -p workspace/celadon
pushd workspace/celadon
#repo init -q -u https://github.com/projectceladon/manifest.git
repo init -q -u file:///mnt/ws/cache/celadon_mirror/manifest.git
repo sync
popd

mkdir -p workspace/system
pushd system
repo init -q -u https://github.com/mattcurf/meta-acrn-manifest.git -b master
repo sync
popd

#./setup -a ../celadon
#sources/meta-acrn/acrn-init-build-env build
#bitbake uos-image-weseton

#MACHINE=apl-nuc bitbake sos-image-weston
#source build/envsetup.sh
#lunch celadon-userdebug
#make SPARSE_IMG=true project_celadon-efi -j $(nproc)
