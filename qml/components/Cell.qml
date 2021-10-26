import QtQuick 2.15
import QtQuick.Layouts 1.0

Rectangle {
    radius: 2
    color: [
        colors.cell_empty,
        colors.cell_wall,
        colors.cell_target,
        colors.cell_visited
    ][model.state]

    Text {
        anchors.centerIn: parent
        text: model.state
        font.pixelSize: 14
        visible: false
    }
}
