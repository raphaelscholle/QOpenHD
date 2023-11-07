import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.12
import QtGraphicalEffects 1.12
import QtQuick.Shapes 1.0
import QtQuick.Controls.Material 2.0

import Qt.labs.settings 1.0

import OpenHD 1.0

import "../elements"

BaseWidget {
    id: sidebar

    visible: settings.show_sidebar

    defaultXOffset: 20
    defaultVCenter: true
    widgetIdentifier: "sidebar"
    bw_verbose_name: "SIDEBAR"
    property int secondaryUiWidth: 335
    property int secondaryUiHeight: 375
    property string secondaryUiColor: "#000"
    property real secondaryUiOpacity: 0.75
    property string mainDarkColor: "#302f30"
    property string highlightColor: "#555"
    property string mcsValue:"3"
    defaultHCenter: false
    hasWidgetDetail: true
    widgetDetailHeight: 250+150
    m_show_grid_when_dragging: true


    Item {
        id: widgetInner
        anchors.fill: parent
        opacity: bw_current_opacity

        //-----------------------ladder start---------------
        Item {
            id: speedLadder

            anchors.right: parent.right
            anchors.rightMargin: 20 //tweak ladder left or right

            visible: settings.speed_ladder_show_ladder

            transform: Scale {
                origin.x: -33
                origin.y: 12
                xScale: bw_current_scale
                yScale: bw_current_scale
            }

        }

        //-----------------------ladder end---------------
        Text {
            anchors.fill: parent
            id: speed_text
            color: settings.color_text
            font.pixelSize: 14
            font.family: settings.font_text
            transform: Scale {
                origin.x: 12
                origin.y: 12
                xScale: bw_current_scale
                yScale: bw_current_scale
            }
            text: get_text_speed()
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            style: Text.Outline
            styleColor: settings.color_glow
        }
        Shape {
            id: outlineGlow
            anchors.fill: parent
            rotation: 180
            transform: Scale {
                origin.x: 12
                origin.y: 12
                xScale: bw_current_scale
                yScale: bw_current_scale
            }
            ShapePath {
                strokeColor: settings.color_glow
                strokeWidth: 3
                strokeStyle: ShapePath.SolidLine
                fillColor: "transparent"
                startX: 0
                startY: 12
                PathLine {
                    x: 0
                    y: 12
                }
                PathLine {
                    x: 12
                    y: 0
                }
                PathLine {
                    x: 58
                    y: 0
                }
                PathLine {
                    x: 58
                    y: 24
                }
                PathLine {
                    x: 12
                    y: 24
                }
                PathLine {
                    x: 0
                    y: 12
                }
            }
        }
        Shape {
            id: outline
            anchors.fill: parent
            rotation: 180
            transform: Scale {
                origin.x: 12
                origin.y: 12
                xScale: bw_current_scale
                yScale: bw_current_scale
            }
            ShapePath {
                strokeColor: settings.color_shape
                strokeWidth: 1
                strokeStyle: ShapePath.SolidLine
                fillColor: "transparent"
                startX: 0
                startY: 12
                PathLine {
                    x: 0
                    y: 12
                }
                PathLine {
                    x: 12
                    y: 0
                }
                PathLine {
                    x: 58
                    y: 0
                }
                PathLine {
                    x: 58
                    y: 24
                }
                PathLine {
                    x: 12
                    y: 24
                }
                PathLine {
                    x: 0
                    y: 12
                }
            }
        }
    }
}

