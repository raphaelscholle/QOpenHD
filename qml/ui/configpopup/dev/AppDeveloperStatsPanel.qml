import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12

import Qt.labs.settings 1.0

import OpenHD 1.0

import "../../../ui" as Ui
import "../../elements"

// Dirty here i place stuff that can be usefully during development
Rectangle {
    id: elementAppDeveloperStats
    Layout.fillHeight: true
    Layout.fillWidth: true

    property int rowHeight: 64
    property int text_minHeight: 20

    color: "#eaeaea"

    function yes_or_no_as_string(yes){
        if(yes) return "Y"
        return "N"
    }

    function get_features_string(){
        var ret = ""
        ret += "AVCODEC:" + yes_or_no_as_string(QOPENHD_ENABLE_VIDEO_VIA_AVCODEC) + ", "
        ret += "MMAL:" + yes_or_no_as_string(QOPENHD_HAVE_MMAL) + ", "
        ret += "GSTREAMER_QMLGLSINK:" + yes_or_no_as_string(QOPENHD_ENABLE_GSTREAMER_QMLGLSINK) + ", "
        return ret;
    }

    ScrollView{
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        contentHeight: main_column_layout.height
        contentWidth: main_column_layout.width
        //ScrollBar.vertical.policy: ScrollBar.AlwaysOn
        ScrollBar.vertical.interactive: true


        ColumnLayout {
            id: main_column_layout
            Layout.fillWidth: true
            Layout.minimumHeight: 30
            spacing: 6
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.margins: 10

            Text {
                id: platformMessage
                property int platformCode: _ohdSystemAir.ohd_platform_type

                function platformName(code) {
                    switch (code) {
                        case 0: return "unknown";
                        case 10: return "X20";
                        case 20: return "x86";
                        case 30: return "rpi";
                        case 31: return "rpi 4";
                        case 32: return "rpi 3";
                        case 33: return "rpi 2";
                        case 34: return "rpi 1";
                        case 35: return "rpi 0";
                        case 40: return "rock";
                        case 41: return "rk3566";
                        case 42: return "rock5a";
                        case 43: return "rock5b";
                        default: return "unknown";
                    }
                }

                text: "Platform: " + platformName(platformCode) + "("+_ohdSystemAir.ohd_platform_type+")"
                Layout.leftMargin: 12
            }
             Text {
                id: wifiMessage
                property int wifiCode: _ohdSystemAir.ohd_wifi_type

                function wifiName(code) {
                    switch (code) {
                        case 11: return "Asus AC56";
                        case 12: return "8812AU CUSTOM";
                        case 21: return "88XXBU";
                        default: return "unknown";
                    }
                }

                text: "Wifi: " + wifiName(wifiCode) + "("+_ohdSystemAir.ohd_wifi_type+")"
                Layout.leftMargin: 12
            }

            Text {
            id: camMessagePi
            visible: [30, 31, 32, 33, 34, 35].indexOf(_ohdSystemAir.ohd_platform_type) !== -1
            property int camCode: _ohdSystemAir.ohd_cam_type

                function camName(code) {
                    switch (code) {
                        case 11: return "OV5647";
                        case 12: return "imx219";
                        case 13: return "imx477";
                        case 14: return "hdmi";
                        case 21: return "IMX462m";
                        case 22: return "IMX477m";
                        case 23: return "IMX708";
                        case 24: return "IMX519";
                        case 25: return "IMX477";
                        case 26: return "IMX462";
                        case 27: return "IMX327";
                        case 28: return "IMX290";
                        case 29: return "libcamera";
                        case 31: return "veye 2MP";
                        case 32: return "veye CSIMX307";
                        case 33: return "veye CSSC132";
                        case 34: return "veye MVCAM";
                        default: return "unknown";
                    }
                }
                text: "Camera: " + camName(camCode) + "("+_ohdSystemAir.ohd_cam_type+")"
                Layout.leftMargin: 12
            }
            Text {
            id: camMessageX20
            visible: [10].indexOf(_ohdSystemAir.ohd_platform_type) !== -1
            property int camCode: _ohdSystemAir.ohd_cam_type

                function camName(code) {
                    switch (code) {
                        case 11: return "HDZERO";
                        default: return "unknown";
                    }
                }
                text: "Camera: " + camName(camCode) + "("+_ohdSystemAir.ohd_cam_type+")"
            Layout.leftMargin: 12
            }
            Text {
                id: identMessage
                text: qsTr("IdentID:" + _ohdSystemAir.ohd_sys_type)
                Layout.leftMargin: 12
            }
            Text {
                id: test1
                text: qsTr("Art Horizon mavlink update rate:" + _fcMavlinkSystem.curr_update_rate_mavlink_message_attitude + " Hz")
                Layout.leftMargin: 12
            }
            Text {
                id: tele_in
                text: qsTr("Tele in" + _mavlinkTelemetry.telemetry_pps_in + " pps")
                Layout.leftMargin: 12
            }
            // air
            Text {
                id: test2
                text: qsTr("video0 FEC encode:  " + _cameraStreamModelPrimary.curr_fec_encode_time_avg_min_max)
                Layout.leftMargin: 12
            }
            Text {
                id: testX
                text: qsTr("video0 TX delay:  " + _cameraStreamModelPrimary.curr_time_until_tx_min_max_avg)
                Layout.leftMargin: 12
            }
            Text {
                id: test4
                text: qsTr("video0 FEC block length:  " + _cameraStreamModelPrimary.curr_fec_block_length_min_max_avg)
                Layout.leftMargin: 12
            }
            // ground
            Text {
                id: test3
                text: qsTr("video0 FEC decode:  " + _cameraStreamModelPrimary.curr_fec_decode_time_avg_min_max)
                Layout.leftMargin: 12
            }
            Text {
                id: test5
                text: qsTr("FEATURES:  " + get_features_string())
                Layout.leftMargin: 12
            }
            Text {
                id: test6
                text: qsTr("Screen resolution: " + _qrenderstats.display_width_height_str)
                Layout.leftMargin: 12
            }
            Text {
                id: test7
                text: qsTr("Window resolution: " + _qrenderstats.window_width_height_str)
                Layout.leftMargin: 12
            }
            Text {
                id: test8
                text: qsTr("You're running on: " + Qt.platform.os)
                Layout.leftMargin: 12
            }
            Button {
                height: 24
                text: "Restart local OHD service"
                onClicked: {
                    _qopenhd.restart_local_oenhd_service()
                }
            }
            Button {
                id: local_ip_button
                height: 24
                text: "Show local IP"
                onClicked: {
                    var text = _qopenhd.show_local_ip()
                    local_ip_button.text = text
                }
            }
            Button {
                id: exp_set_rates
                height: 24
                text: "Set Tele rates"
                onClicked: {
                    _mavlinkTelemetry.re_apply_rates()
                }
            }

            RowLayout {
                width: parent.width
                height: 200
                visible: _qopenhd.is_linux()
                Button {
                    text: "Sysctl start openhd"
                    onClicked: {
                        _qopenhd.sysctl_openhd(0);
                    }
                }
                Button {
                    text: "Sysctl stop openhd"
                    onClicked: {
                        _qopenhd.sysctl_openhd(1);
                    }
                }
                Button {
                    text: "Sysctl enable openhd"
                    onClicked: {
                        _qopenhd.sysctl_openhd(2);
                    }
                }
                Button {
                    text: "Sysctl disable openhd"
                    onClicked: {
                        _qopenhd.sysctl_openhd(3);
                    }
                }
            }

            RowLayout {
                width: parent.width

                Button {
                    font.capitalization: Font.MixedCase
                    text: qsTr("DEV-Restart QOpenHD")
                    onPressed: {
                        qopenhdservicedialoque.open_dialoque(0)
                    }
                }
                Button {
                    font.capitalization: Font.MixedCase
                    text: qsTr("DEV-Cancel QOpenHD")
                    onPressed: {
                        qopenhdservicedialoque.open_dialoque(1)
                    }
                }
                Item {
                    // Padding
                }
            }
        }
    }
    QOpenHDServiceDialoque{
        id: qopenhdservicedialoque
    }
}
