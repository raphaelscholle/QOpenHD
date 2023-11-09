#!/usr/bin/env bash

#remove custom QT
dpkg -r openhd-qt-jammy || true
rm -Rf /etc/systemd/system/h26*
rm -Rf /etc/systemd/system/qopenhd*
