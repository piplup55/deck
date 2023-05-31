# Ryujinx Mesa 22
Reverting to mesa 22 on deck

## Why?
some games started to crash due to mesa 23.1 with a **Unexpected API error "ErrorDeviceLost"**, reverting mesa will fix the issue but **i don't recommand it**

## Automatic install

`curl https://raw.githubusercontent.com/piplup55/misc/ryujinx/mesa/autoinstall.sh | sh`

## Manual install

start by downloading [vulkan-radeon 22.2.1](https://steamdeck-packages.steamos.cloud/archlinux-mirror/extra-main/os/x86_64/vulkan-radeon-22.2.1-1-x86_64.pkg.tar.zst)

1. grab the .so file in `/usr/lib` along with the [radeon_icd.x86_64.json](https://github.com/piplup55/misc/blob/ryujinx/mesa/mesa/22.1.1/radeon_icd.x86_64.json) and copy them to `/home/deck/emudeck/mesa/22.2.1` from this repo

2. grab the [ryujinx.sh](https://github.com/piplup55/misc/blob/ryujinx/mesa/ryujinx.sh) and copy it to `/home/deck/Emulation/tools/launchers` **remember to make a backup**

and now whenever you launch ryujinx it should use mesa 22.2.1 **but only for vulkan keep this in mind**

## Custom Mesa (Advanced)

start by finding the [version](https://steamdeck-packages.steamos.cloud/archlinux-mirror/) you want to use,  
you normally find these under the extra repos for example `extra-3.3/os/x86_64/`  

for this example i will be using vulkan-radeon 21.3.4-1

1. grab the .so file in `/usr/lib` along with the [radeon_icd.x86_64.json](https://github.com/piplup55/misc/blob/ryujinx/mesa/mesa/templates/radeon_icd.x86_64.json) and copy them to `/home/deck/emudeck/mesa/YOUR VERSION` from this repo,  
in my case it would be `/home/deck/emudeck/mesa/21.3.4`

2. change the `/home/deck/emudeck/mesa/version/libvulkan_radeon.so` line in radeon_icd.x86_64.json to `/home/deck/emudeck/mesa/YOUR VERSION/libvulkan_radeon.so`

so i would put this
```
{
    "ICD": {
        "api_version": "1.3.230",
        "library_path": "/home/deck/emudeck/mesa/21.3.4/libvulkan_radeon.so"
    },
    "file_format_version": "1.0.0"
}
```

3. grab the [ryujinx.sh](https://github.com/piplup55/misc/blob/ryujinx/mesa/ryujinx.sh) and copy it to `/home/deck/Emulation/tools/launchers` **remember to make a backup**

4. edit the ryujinx.sh and change mesaversion to your version

in my case `mesaversion="21.3.4"`