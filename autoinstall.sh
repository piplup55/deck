#!/bin/sh
set -x
. "$HOME/emudeck/settings.sh"

mkdir -p "$HOME/emudeck/mesa/22.2.1/"

curl -l "https://raw.githubusercontent.com/piplup55/misc/ryujinz/mesa/mesa/22.1.1/radeon_icd.x86_64.json" -o "$HOME/emudeck/mesa/22.2.1/radeon_icd.x86_64.json"
curl -l "https://steamdeck-packages.steamos.cloud/archlinux-mirror/extra-main/os/x86_64/vulkan-radeon-22.2.1-1-x86_64.pkg.tar.zst" -o "$HOME/emudeck/mesa/22.2.1/radeon.tar.zst"
tar --extract  -C "$HOME/emudeck/mesa/22.2.1/" --file="$HOME/emudeck/mesa/22.2.1/radeon.tar.zst" "usr/lib/libvulkan_radeon.so" --strip-components=2 && rm -f "$HOME/emudeck/mesa/22.2.1/radeon.tar.zst"

if [ -e "$toolsPath\launchers\ryujinx.sh" ]; then
    mv "$toolsPath\launchers\ryujinx.sh" "$toolsPath\launchers\ryujinx.sh.bak"
fi

curl -l "https://raw.githubusercontent.com/piplup55/misc/ryujinx/mesa/ryujinx.sh" -o "$toolsPath\launchers\ryujinx.sh" && chmod +x "$toolsPath\launchers\ryujinx.sh"