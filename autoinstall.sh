#!/bin/sh
. "$HOME/emudeck/settings.sh"

mkdir -p "$HOME/emudeck/mesa/22.2.1/"

curl -l "https://raw.githubusercontent.com/piplup55/misc/yuzu-mesa-22/mesa/22.1.1/radeon_icd.x86_64.json" -o "$HOME/emudeck/mesa/22.2.1/radeon_icd.x86_64.json"
curl -l "https://steamdeck-packages.steamos.cloud/archlinux-mirror/extra-main/os/x86_64/vulkan-radeon-22.2.1-1-x86_64.pkg.tar.zst" -o "$HOME/emudeck/mesa/22.2.1/radeon.tar.zst"
tar --extract  -C "$HOME/emudeck/mesa/22.2.1/" --file="$HOME/emudeck/mesa/22.2.1/radeon.tar.zst" "usr/lib/libvulkan_radeon.so" --strip-components=2 && rm -f "$HOME/emudeck/mesa/22.2.1/radeon.tar.zst"

if [ -e "$toolsPath\launchers\yuzu.sh" ]; then
    mv "$toolsPath\launchers\yuzu.sh" "$toolsPath\launchers\yuzu.sh.bak"
fi

curl -l "https://raw.githubusercontent.com/piplup55/misc/yuzu-mesa-22/yuzu.sh" -o "$toolsPath\launchers\yuzu.sh" && chmod +x "$toolsPath\launchers\yuzu.sh"