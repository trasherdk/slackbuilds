  
SB_PATCHDIR=${CWD}/patches

zcat ${SB_PATCHDIR}/${NAME}-4.1.x-searchproviders-shortcuts.patch.gz | patch -p1 -E --backup --verbose || exit 1
zcat ${SB_PATCHDIR}/${NAME}-4.2.85-knetattach.patch.gz | patch -p1 -E --backup --verbose || exit 1
zcat ${SB_PATCHDIR}/${NAME}-4.1.1-iconthemes-inherit.patch.gz | patch -p1 -E --backup --verbose || exit 1
zcat ${SB_PATCHDIR}/${NAME}-4.3.1-manpath.patch.gz | patch -p1 -E --backup --verbose || exit 1
# add OnlyShowIn=KDE  to Desktop/Home.desktop (like trash.desktop)
zcat ${SB_PATCHDIR}/${NAME}-4.3.3-home_onlyshowin_kde.patch.gz | patch -p1 -E --backup --verbose || exit 1

## 4.4 Upstream patches
zcat ${SB_PATCHDIR}/kdebase-runtime-4.4.0-virtuosoconverter.patch.gz | patch -p1 -E --backup --verbose || exit 1
