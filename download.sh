#!/bin/bash
  
git config --global user.email "builder@user.com"
git config --global user.name "builder"
git config --global color.ui false

mkdir -p workspace/celadon && pushd workspace/celadon
#repo init -q -u https://github.com/projectceladon/manifest.git
repo init -q -u file:///mnt/ws/cache/celadon_mirror/manifest.git -m stable-build/ww201913.xml
repo sync -j $(nproc)
popd

mkdir -p workspace/system
pushd workspace/system
repo init -q -u https://github.com/mattcurf/meta-acrn-manifest.git -b master
repo sync -j $(nproc)
popd

pushd workspace/system
. acrn-init-build-env
cat > conf/local.conf << EOF
EXTERNALSRC = `pwd`../../celadon
EOF
#MACHINE=apl-nuc bitbake uos-image-weston
popd

#MACHINE=apl-nuc bitbake sos-image-weston
#source build/envsetup.sh
#lunch celadon-userdebug
#make SPARSE_IMG=true project_celadon-efi -j $(nproc)
