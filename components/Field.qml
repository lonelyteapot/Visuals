import QtQuick 2.15
import QtQuick.Layouts 2

Rectangle {
//    color: "#FFF8EB"
    color: "#533747"
    onWidthChanged: resizeToFit()
    onHeightChanged: resizeToFit()
    clip: true

    property bool drawingEnabled: false
    // TODO State enum
    property int drawingResult: 0
    readonly property int cellSize: 24

    TableView {
        id: table
        anchors.centerIn: parent
        implicitWidth: contentWidth
        implicitHeight: contentHeight
        rowSpacing: 1
        columnSpacing: 1
        interactive: false
        model: _fieldModel

        delegate: Cell {
            implicitWidth: cellSize
            implicitHeight: cellSize
        }

        Rectangle {
            anchors.fill: parent
            anchors.margins: -1
            radius: 2
            color: "#FFF8EB"
        }
    }

    function resizeToFit() {
        const rows = Math.round((height + table.rowSpacing) / (cellSize + table.rowSpacing)) - 1
        const columns = Math.round((width + table.columnSpacing) / (cellSize + table.columnSpacing)) - 1
        if ((rows !== table.rows) || (columns !== table.columns)) {
            _fieldModel.resize(rows, columns)
        }
    }
}
