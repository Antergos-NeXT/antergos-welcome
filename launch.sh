#!/bin/sh
# Script to generate mo files in a temp locale folder
# Use it only for testing purpose
rm -rf $PWD/locale
mkdir $PWD/locale
for lang in $(ls $PWD/po/*.po); do
    lang=${lang::-3}
    mkdir -p $PWD//locale/${lang//_/-}/LC_MESSAGES
    msgfmt -c -o $PWD//locale/${lang//_/-}/LC_MESSAGES/antergos-welcome.mo $lang.po
done
python3 src/antergos_welcome.py --dev
