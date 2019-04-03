#!/bin/bash

set -e
export DEBIAN_FRONTEND noninteractive
export TERM xterm

apt-get update
apt-get -y install apt-utils automake bc bison bsdmainutils build-essential \
  bzip2 ccache chrpath cpio curl debianutils diffstat dosfstools dpkg-dev efitools \
  flex gawk gcc-multilib gettext git git-core g++-multilib gperf locales iputils-ping \
  libbz2-1.0 libbz2-dev libelf-dev libffi-dev libghc-bzlib-dev liblz4-tool libsdl1.2-dev \
  libssl-dev libxml2-utils lzop make maven mtools openjdk-8-jdk optipng pngcrush python \
  python-pip python3 python3-pexpect python3-pip python-mako python-networkx python-lxml \
  sbsigntool schedtool socat squashfs-tools texinfo unzip wget xz-utils zip zlib1g-dev xterm
pip install --upgrade pip
pip install pycrypto

git config --global user.email "builder@user.com"
git config --global user.name "builder"
git config --global color.ui false

mkdir -p ~/bin
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
export PATH=~/bin/repo:$PATH

mkdir -p workspace/celadon && pushd workspace/celadon
#repo init -q -u https://github.com/projectceladon/manifest.git -m stable-build/ww201913.xml
#repo init -q -u file:///mnt/ws/cache/celadon_mirror/manifest.git -m stable-build/ww201913.xml
#repo sync -j $(nproc)
#unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
#source build/envsetup.sh
#lunch celadon-userdebug
#make SPARSE_IMG=true project_celadon-efi -j $(nproc)
popd

mkdir -p workspace/system
pushd workspace/system
repo init -q -u https://github.com/mattcurf/meta-acrn-manifest.git -b master
repo sync
#. acrn-init-build-env
#cat >> conf/local.conf << EOF
#EXTERNALSRC = "`pwd`/../../celadon"
#EOF
#MACHINE=apl-nuc bitbake sos-image-weston
popd
