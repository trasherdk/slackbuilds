  
SB_PATCHDIR=${CWD}/patches

zcat ${SB_PATCHDIR}/${NAME}-0.9.95-find-kompare.patch.gz | patch -p1 -E --backup --verbose || exit 1
