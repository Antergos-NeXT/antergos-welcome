#!/bin/sh
# Script to generate mo files in a temp locale folder
# Use it only for testing purpose
export APPS_PROJECT_DIR="/a/projects/repos/manjaro/application-utility"
export LAYOUT_PROJECT_DIR="/a/projects/repos/manjaro/gnome-layout-switcher/bin"
rm -rf $PWD/locale
mkdir $PWD/locale
for lang in $(ls $PWD/po/*.po); do
    lang=${lang::-3}
    mkdir -p $PWD//locale/${lang//_/-}/LC_MESSAGES
    msgfmt -c -o $PWD//locale/${lang//_/-}/LC_MESSAGES/manjaro-hello.mo $lang.po
done
export PLUGIN_HELLO=True
export PYTHONPATH="${APPS_PROJECT_DIR}:${LAYOUT_PROJECT_DIR}"
python3 src/manjaro_hello.py --dev
