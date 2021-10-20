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
            text: "Randomize field"
            font.pixelSize: 18
        }

        Button {
            Layout.fillWidth: true
            Layout.preferredHeight: 40
            text: "Visit random cell"
            font.pixelSize: 18
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
