#!/bin/sh
source $HOME/.config/EmuDeck/backend/functions/all.sh
rclone_downloadEmu ryujinx
emuName="Ryujinx" #parameterize me
emufolder="$HOME/Applications/publish" # has to be applications for ES-DE to find it
mesaversion="22.2.1" # putting `system` in mesaversion disbles custom icd's

if [ -e "/home/deck/emudeck/mesa/${mesaversion}/radeon_icd.x86_64.json" ]; then
    export VK_ICD_FILENAMES="/home/deck/emudeck/mesa/${mesaversion}/radeon_icd.x86_64.json"
fi

#find full path to emu executable
exe=$(find $emufolder -iname "${emuName}" | sort -n | cut -d' ' -f 2- | tail -n 1 2>/dev/null)

#if appimage doesn't exist fall back to flatpak.
if [[ $exe == '' ]]; then
    #flatpak
    flatpakApp=$(flatpak list --app --columns=application | grep $emuName)
    exe="/usr/bin/flatpak run "$flatpakApp
else
#make sure that file is executable
    chmod +x $exe
fi
#run the executable with the params.
#Fix first '
param="${@}"
substituteWith='"'
param=${param/\'/"$substituteWith"}
#Fix last ' on command
param=$(echo "$param" | sed 's/.$/"/')
eval "${exe} ${param}"
rclone_uploadEmu ryujinx