  
SB_PATCHDIR=${CWD}/patches

zcat ${SB_PATCHDIR}/klaptopdaemon-3.5-checksum.diff.gz | patch -p1 --verbose || exit 1
zcat ${SB_PATCHDIR}/superkaramba-3.5.7-network_sensor.patch.gz | patch -p2 --verbose || exit 1
zcat ${SB_PATCHDIR}/kdf-3.0.2-label.patch.gz | patch -p1 --verbose || exit 1
zcat ${SB_PATCHDIR}/${NAME}-3.5.4-bz\#205553.patch.gz | patch -p1 --verbose || exit 1
zcat ${SB_PATCHDIR}/${NAME}-3.5.10-r995144.patch.gz | patch -p4 --verbose || exit 1

# tweak autoconfigury so that it builds with autoconf 2.64 or 2.65
zcat ${SB_PATCHDIR}/arts-acinclude.patch.gz | patch -p1 -E --backup --verbose || exit 1

# KDEmod patches
zcat ${SB_PATCHDIR}/04_xmms-dynamic.patch.gz | patch -p1 --verbose || exit 1

zcat ${SB_PATCHDIR}/kde-python-2.6.patch.gz | patch -p0 -E --backup --verbose || exit 1

#zcat ${SB_PATCHDIR}/${NAME}-3.5.10-lzma-support.patch.gz | patch -p0 -E --backup --verbose || exit 1
