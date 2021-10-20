import QtQuick 2.15
import QtQuick.Layouts 1.0

Rectangle {
    color: "#FFF8EB"

    TableView {
        anchors.centerIn: parent
        implicitWidth:  25 * columns - 1
        implicitHeight: 25 * rows - 1
        rowSpacing: 1
        columnSpacing: 1
        interactive: false
        model: _fieldModel

        delegate: Cell {
            implicitWidth: 24
            implicitHeight: 24
        }
    }
}
