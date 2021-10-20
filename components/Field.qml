import QtQuick 2.15
import QtQuick.Layouts 1.0

Rectangle {
    color: "#FFF8EB"
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
    }

    function resizeToFit() {
        const rows = Math.floor((height + table.rowSpacing) / (cellSize + table.rowSpacing)) + 1
        const columns = Math.floor((width + table.columnSpacing) / (cellSize + table.columnSpacing)) + 1
        if ((rows !== table.rows) || (columns !== table.columns)) {
            _fieldModel.resize(rows, columns)
        }
    }
}
