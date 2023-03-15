# Yuzu Mesa 22
Reverting to mesa 22 on deck

start by downloading [vulkan-radeon 22.2.1](https://steamdeck-packages.steamos.cloud/archlinux-mirror/extra-main/os/x86_64/vulkan-radeon-22.2.1-1-x86_64.pkg.tar.zst)

1. grab the .so file in `/usr/lib` along with the [radeon_icd.x86_64.json](https://github.com/piplup55/misc/tree/yuzu-mesa/mesa/22.2.1/radeon_icd.x86_64.json) and copy them to `/home/deck/emudeck/mesa/22.2.1` from this repo

2. grab the yuzu.sh and copy it to `/home/deck/Emulation/tools/launchers` **remember to make a backup**

and now whenever you launch yuzu it should use mesa 22.2.1 **but only for vulkan keep this in mind**