import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0

Rectangle {
    color: colors.sidebar_bg

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 8

        Button {
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            text: "Clear field"
            font.pixelSize: 18
            onReleased: _fieldModel.clearField()
            background: Rectangle {
                color: colors.field_bg
                radius: 5
            }
        }

        Button {
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            text: "Randomize field"
            font.pixelSize: 18
            palette.button: "green"
            onReleased: _fieldModel.randomizeField()
            background: Rectangle {
                color: colors.field_bg
                radius: 5
            }
        }

        ToolSelector {
            Layout.fillWidth: true
            color: colors.field_bg
            radius: 5
        }

        Item {
            Layout.fillHeight: true
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            color: colors.field_bg
            radius: 5

            Rectangle {
                anchors.fill: parent
                opacity: 0.25
                color: field.drawingEnabled ? field.drawingResult ? "green" : "red" : "transparent"
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.verticalCenter
                text: "Left click - draw walls"
                font.bold: field.drawingEnabled && field.drawingResult
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.verticalCenter
                text: "Right click - erase walls"
                font.bold: field.drawingEnabled && !field.drawingResult
            }
        }
    }
}
