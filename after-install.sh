#!/usr/bin/env bash

if [[ -f "/usr/local/share/openhd_platform/rock/rk3566" ]]; then
    ln -s /etc/systemd/system/qopenhd/rock3_qopenhd.service /etc/systemd/system/qopenhd.service
    ln -s /etc/systemd/system/qopenhd/rock3_h264_decode.service /etc/systemd/system/h264_decode.service
    ln -s /etc/systemd/system/qopenhd/rock3_h265_decode.service /etc/systemd/system/h265_decode.service
elif [[ -f "/usr/local/share/openhd_platform/rock/rock5a" ]]; then
    ln -s /etc/systemd/system/qopenhd/rock5_qopenhd.service /etc/systemd/system/qopenhd.service
    ln -s /etc/systemd/system/qopenhd/rock5_h264_decode.service /etc/systemd/system/h264_decode.service
    ln -s /etc/systemd/system/qopenhd/rock5_h265_decode.service /etc/systemd/system/h265_decode.service
elif [[ -f "/usr/local/share/openhd_platform/rock/tock5b" ]]; then
    ln -s /etc/systemd/system/qopenhd/rock5_qopenhd.service /etc/systemd/system/qopenhd.service
    ln -s /etc/systemd/system/qopenhd/rock5_h264_decode.service /etc/systemd/system/h264_decode.service
    ln -s /etc/systemd/system/qopenhd/rock5_h265_decode.service /etc/systemd/system/h265_decode.service
fi

# the openhd scripts start the correct OSD depending on the distro and settings
if [ -f /etc/systemd/system/qopenhd.service ]; then
    systemctl enable qopenhd.service
else
    echo "QOpenHD is not started with a service on this system"
fi

#cd /usr/local/share/
#if [ -d "/usr/local/share/testvideos" ]; then
#  # Take action if $DIR exists. #
#  echo "Testvideos are already there"
#else
#git clone https://github.com/OpenHD/testvideos/ /usr/local/share/testvideos
#fi
