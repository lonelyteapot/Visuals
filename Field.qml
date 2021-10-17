import QtQuick 2.15

TableView {
    id: field

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
