import QtQuick 2.15
import QtQuick.Layouts 1.0

Rectangle {
    id: field
    color: "#FFF8EB"

    TableView {
        anchors.centerIn: parent
        implicitWidth:  25 * columns - 1
        implicitHeight: 25 * rows - 1
        rowSpacing: 1
        columnSpacing: 1
        interactive: false
        model: _fieldModel

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
