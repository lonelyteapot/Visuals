import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0

Rectangle {
    color: "#FFECCC"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 8

        Button {
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            text: "Clear field"
            font.pixelSize: 18
        }

        Button {
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            text: "Randomize field"
            font.pixelSize: 18
        }

        Item {
            Layout.fillHeight: true
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            color: field.drawingEnabled ? field.drawingResult ? "#2800FF00" : "#28FF0000" : "#28000000"
            radius: 5

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
