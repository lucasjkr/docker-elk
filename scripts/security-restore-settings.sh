#/bin/sh
NEMOHOME="$( cd "$(dirname "$0")" ; pwd -P )"/../
mkdir -p ${NEMOHOME}/opt/
cp ~/nemo-security-backup/* ${NEMOHOME}/opt/
