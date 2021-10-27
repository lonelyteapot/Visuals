import QtQuick 2.15
import QtQuick.Layouts 2

Rectangle {
    color: colors.cell_wall
    clip: true

    property bool drawingEnabled: field_mouse_area.containsPress
    default property int drawingResult
    // TODO State enum

    readonly property int cellSize: 24
    readonly property int fullCellSize: cellSize + 1

    readonly property int rows: (height - 5) / fullCellSize
    readonly property int columns: (width - 5) / fullCellSize

    onRowsChanged: table.model.resize(rows, columns)
    onColumnsChanged: table.model.resize(rows, columns)

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
            color: colors.field_bg
        }

        MouseArea {
            id: field_mouse_area
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton

            property int last_row: 0
            property int last_col: 0

            onPressed:
                (mouse) => {
                    last_row = Math.floor(mouse.y / fullCellSize)
                    last_col = Math.floor(mouse.x / fullCellSize)
                    positionChanged(mouse)
                }

            onPositionChanged:
                (mouse) => {
                    drawingResult = (mouse.buttons & Qt.LeftButton) ? 1 : 0
                    // TODO State enum

                    let row = Math.floor(mouse.y / fullCellSize)
                    let col = Math.floor(mouse.x / fullCellSize)

                    let row_step = last_row < row ? 1 : -1
                    let col_step = last_col < col ? 1 : -1

                    let col_k = 0
                    let max_k = Math.abs((row - last_row) / (col - last_col))
                    let cur_row = last_row
                    let cur_col = last_col

                    while (true) {
                        table.model.setStateAt(cur_row, cur_col, drawingResult)

                        if (cur_row === row && cur_col === col) break

                        if (Math.abs(cur_row - row) > Math.abs(cur_col - col) && col_k <= max_k) {
                            col_k += 1
                            cur_row += row_step
                        } else {
                            col_k = 0
                            cur_col += col_step
                        }
                    }

                    last_row = row
                    last_col = col
                }
        }
    }
}
