#/bin/sh
NEMOHOME="$( cd "$(dirname "$0")" ; pwd -P )"/../
mkdir -p ~/nemo-security-backup
cp ${NEMOHOME}/opt/* ~/nemo-security-backup
