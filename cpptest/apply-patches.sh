
set -e -o pipefail

SB_PATCHDIR=${CWD}/patches

patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}-1.1.0-libcpptest_pc_in.patch

set +e +o pipefail