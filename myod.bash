#!/bin/bash

commands="gcc ld git tar tinyramfs"

function check {
    for com in $commands; do
        echo "checking for "$com"..."
        if ! command -v $com 2>&1 >/dev/null; then
            echo "command "$com" doesn't exist"
            exit 1
        fi
    done
}

function prepare {
    echo ":: Preparing filesystem"
    rm -rf out src
    mkdir -p out src
    mkdir -p out/boot out/proc out/run out/dev out/opt out/var out/tmp out/sys out/etc
    mkdir -p out/usr/bin out/usr/sbin out/usr/lib out/usr/lib32 out/usr/share out/usr/src out/usr/local/bin out/usr/local/lib out/usr/include
    ln -s usr/bin out/bin
    ln -s usr/sbin out/sbin
    ln -s usr/lib out/lib
    ln -s usr/lib out/lib64
    ln -s usr/lib32 out/lib32
    ln -s lib out/usr/lib64
    echo "NAME=\"MOLinux\"
PRETTY_NAME=\"My Own Linux (Drywave)\"
ID=mol
BUILD_ID=drywave
HOME_URL=\"https://github.com/etar125/\"
DOCUMENTATION_URL=\"https://github.com/etar125/\"
SUPPORT_URL=\"https://github.com/etar125/\"
BUG_REPORT_URL=\"https://github.com/etar125/\"
PRIVACY_POLICY_URL=\"https://github.com/etar125/\"
LOGO=molinux-logo" > out/usr/lib/os-release
    ln -s ../usr/lib/os-release out/etc/os-release
}

function welcome {
    echo "      Welcome to..."
    echo "  MAKE YOUR OWN DISTRO"
    echo "      0.01_271224"
    echo "       (Drywave)"
}

function kernel {
    echo "Choose linux kernel version:"
    echo "1) 6.6.67 LTS *Recommended"
    echo "2) 5.15.176 LTS"
    echo "3) 6.12.6 *Latest"
    read knum
}

function core {
    echo "Choose core utils:"
    echo "1) GNU"
    echo "2) sbase"
    echo "3) 9base"
    echo "4) Busybox"
    echo "5) Toybox"
    read cnum
}

function linux {
    echo "Choose linux utils:"
    echo "1) utillinux"
    echo "2) ubase"
    read lnum
}

function downloadAll {
    echo ":: Downloading all"
}

function buildAll {
    echo ":: Building all"
}

function installAll {
    echo ":: Installing all"
}

function clean {
    echo ":: Cleaning"
}

function initrd {
    echo ":: Making initrd"
}

function scripts {
    echo ":: Installing Morpheus init scripts"
}

echo "Are you sure? [yes/no]"
read sure
if [ $sure != "yes" ]; then
    exit 0
fi
check
welcome
prepare
echo ":: Questions"
kernel
core
linux
downloadAll
buildAll
installAll
clean
scripts
initrd
echo "Done!"
