
set -e -o pipefail

SB_PATCHDIR=${CWD}/patches

# patch -p0 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mariadb-errno.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mariadb-strmov.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mariadb-install-test.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mariadb-expired-certs.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mariadb-versioning.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mariadb-dubious-exports.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mariadb-s390-tsc.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mariadb-logrotate.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mariadb-cipherspec.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mariadb-file-contents.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mariadb-string-overflow.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mariadb-dh1024.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mariadb-man-plugin.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mariadb-basedir.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/mariadb-tmpdir.patch

set +e +o pipefail
