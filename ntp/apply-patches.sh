  
SB_PATCHDIR=${CWD}/patches

# ntpbz #628, #1073
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p4-kernel.patch.gz | patch -p1 -E --backup --verbose || exit 1
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p0-droproot.patch.gz | patch -p1 -E --backup --verbose || exit 1
# ntpbz #812
zcat ${SB_PATCHDIR}/${NAME}-4.2.4-groups.patch.gz | patch -p1 -E --backup --verbose || exit 1
# ntpbz #1170
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p7-daemonpll.patch.gz | patch -p1 -E --backup --verbose || exit 1
#zcat ${SB_PATCHDIR}/${NAME}-4.2.4-linkfastmath.patch.gz | patch -p1 -E --backup --verbose || exit 1
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p2-tentative.patch.gz | patch -p1 -E --backup --verbose || exit 1
# ntpbz #897
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p2-noseed.patch.gz | patch -p1 -E --backup --verbose || exit 1
# ntpbz #830
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p4-multilisten.patch.gz | patch -p1 -E --backup --verbose || exit 1
zcat ${SB_PATCHDIR}/${NAME}-4.2.4-html2man.patch.gz | patch -p1 -E --backup --verbose || exit 1
# ntpbz #898
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p5-htmldoc.patch.gz | patch -p1 -E --backup --verbose || exit 1
# fixed in 4.2.5
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p2-filegen.patch.gz | patch -p1 -E --backup --verbose || exit 1
# ntpbz #738
zcat ${SB_PATCHDIR}/${NAME}-4.2.4-sprintf.patch.gz | patch -p1 -E --backup --verbose || exit 1
# add option -m to lock memory
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p8-mlock.patch.gz | patch -p1 -E --backup --verbose || exit 1
# fixed in 4.2.5
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p2-clockselect.patch.gz | patch -p1 -E --backup --verbose || exit 1
# don't build sntp
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p8-nosntp.patch.gz | patch -p1 -E --backup --verbose || exit 1
# ntpbz #802
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p5-sleep.patch.gz | patch -p1 -E --backup --verbose || exit 1
# ntpbz #779, #823
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p7-bcast.patch.gz | patch -p1 -E --backup --verbose || exit 1
# ntpbz #759
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p0-retcode.patch.gz | patch -p1 -E --backup --verbose || exit 1
# ntpbz #397
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p2-noif.patch.gz | patch -p1 -E --backup --verbose || exit 1
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p7-ipv6.patch.gz | patch -p1 -E --backup --verbose || exit 1
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p4-cmsgalign.patch.gz | patch -p1 -E --backup --verbose || exit 1
# clock_gettime needs -lrt
sed -i.gettime 's|^LIBS = @LIBS@|& -lrt|' ntp{d,q,dc,date}/Makefile.in
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p8-gettime.patch.gz | patch -p1 -E --backup --verbose || exit 1
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p4-resinit.patch.gz | patch -p1 -E --backup --verbose || exit 1
# ntpbz #992
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p5-rtnetlink.patch.gz | patch -p1 -E --backup --verbose || exit 1
# don't log STA_MODE (PLL/FLL) changes
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p7-stamode.patch.gz | patch -p1 -E --backup --verbose || exit 1
# ntpbz #808
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p5-driftonexit.patch.gz | patch -p1 -E --backup --verbose || exit 1
# add missing nanokernel macros
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p7-nano.patch.gz | patch -p1 -E --backup --verbose || exit 1
# allow minpoll 3 as in 4.2.5
zcat ${SB_PATCHDIR}/${NAME}p-4.2.4p7-minpoll.patch.gz | patch -p1 -E --backup --verbose || exit 1
# fix frequency mode, backported from 4.2.5
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p7-freqmode.patch.gz | patch -p1 -E --backup --verbose || exit 1
# fix precision calculation on fast CPUs
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p7-getprecision.patch.gz | patch -p1 -E --backup --verbose || exit 1

# replace BSD with advertising code in ntp{dc,q} to allow linking with readline
for f in include/{ntp_rfc2553,rsa_md5}.h \
  libntp/{mktime,memmove,md5c,ntp_rfc2553,ntp_random}.c
do rm -f ${f}; touch ${f}; done
ln -sf md5.h include/rsa_md5.h
ln -sf md5.c libntp/md5c.c
zcat ${SB_PATCHDIR}/${NAME}-4.2.4p4-bsdadv.patch.gz | patch -p1 -E --backup --verbose || exit 1

( cd ntpstat-${NSVER} || exit 1
  # handle unknown clock types
  zcat ${SB_PATCHDIR}/ntpstat-0.2-clksrc.patch.gz | patch -p2 -E --backup --verbose || exit 1
  # process first packet in multipacket response
  zcat ${SB_PATCHDIR}/ntpstat-0.2-multipacket.patch.gz | patch -p2 -E --backup --verbose || exit 1
) || exit 1

if [ "${SB_AVAHI}" != "YES" ] ;then
  zcat ${SB_PATCHDIR}/${NAME}-4.2.4p6-noavahi.patch.gz | patch -p0 -E --backup --verbose || exit 1
  autoreconf -if || exit 1
fi

