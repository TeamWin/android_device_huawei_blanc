#!/sbin/sh

if [ -d /dev/block/platform/ff3c0000.ufs ]; then
    echo "using ufs"
    ln -sf /dev/block/platform/ff3c0000.ufs /dev/block/bootdevice
else
    echo "using emmc"
    ln -sf /dev/block/platform/hi_mci.0 /dev/block/bootdevice
fi

# Creates new symlinks without the _a in them since this device does
# not really have boot slots (silly Huawei...)

for f in /dev/block/bootdevice/by-name/*_a
do
	ln -sf $f ${f%??}
done
