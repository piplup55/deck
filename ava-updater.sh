#!/bin/sh
cd /tmp
curl -s https://api.github.com/repos/Ryujinx/release-channel-master/releases/latest \
| grep -e "https.*ava-.*linux" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -qi -

FILE=`find /tmp -name '*ava*linux*' 2>/dev/null`
tar xf $FILE -C /home/deck/Applications/
curl https://raw.githubusercontent.com/piplup55/misc/ryujinx-ava/ryujinx.sh > /tmp/ryujinx.sh
mv /tmp/ryujinx.sh /home/deck/Emulation/tools/launchers/ryujinx.sh
rm $FILE 
