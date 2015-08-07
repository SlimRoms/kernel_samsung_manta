#!/bin/bash

# Stupid shell script to compile kernel, nothing fancy

# Exports all the needed things Arch, SubArch and Cross Compile
export ARCH=arm
echo 'exporting Arch'
export SUBARCH=arm
echo 'exporting SubArch'
#export CROSS_COMPILE=/home/prbassplayer/lp5.1/prebuilt/linux-x86/toolchain/linaro-4.8-13.06/bin/arm-linux-gnueabihf-
# TODO make this more universal
export CROSS_COMPILE=/home/prbassplayer/lp5.1/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin/arm-eabi-
echo 'exporting Cross Compile'

# Make sure build is clean!
echo 'Cleaning build'
make clean

# Generates a new .config and exists
if [ "$1" = "config" ] ; then
echo 'Making defconfig for Manta'
make slim_manta_defconfig
exit
fi

# Exports kernel local version? Not sure yet.
#echo 'Exporting kernel version'
#export LOCALVERSION='SlimTest_1.0'

# Lets go!
echo 'Lets start!'
make -j$1
