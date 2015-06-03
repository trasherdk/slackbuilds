
set -e -o pipefail

SB_PATCHDIR=${CWD}/patches

# patch -p0 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}.patch
patch -p0 -E --backup -z .noyum --verbose -i ${SB_PATCHDIR}/${NAME}-3.0.0-noyum.patch

set +e +o pipefail
