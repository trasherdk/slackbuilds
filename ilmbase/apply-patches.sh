
set -e -o pipefail

SB_PATCHDIR=${CWD}/patches

# patch -p0 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}.patch
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}-1.0.2-cstring.patch
# explicitly add $(PTHREAD_LIBS) to libIlmThread linkage (helps workaround below)
patch -p1 -E --backup --verbose -i ${SB_PATCHDIR}/${NAME}-1.0.2-no_undefined.patch

set +e +o pipefail