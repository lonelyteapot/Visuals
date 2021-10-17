import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Layouts 1.0

Window {
    width: 824
    height: 404
    visible: true
    title: qsTr("Visuals")

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Sidebar {
            Layout.preferredWidth: 220
            Layout.fillHeight: true
        }

        TableView {
            Layout.fillWidth: true
            Layout.fillHeight: true

            model: _fieldModel
            rowSpacing: 1
            columnSpacing: 1
            interactive: false

            delegate: Rectangle {
                implicitWidth: 24
                implicitHeight: 24
                radius: 2
                // EMPTY, WALL, TARGET, VISITED
                color: ["#6A6B83", "#533747", "#D33F49", "green"][model.state]

                Text {
                    anchors.centerIn: parent
                    text: model.state
                    font.pixelSize: 14
                    visible: false
                }
            }
        }
    }
}
