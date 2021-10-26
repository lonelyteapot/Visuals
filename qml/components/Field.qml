import QtQuick 2.15
import QtQuick.Layouts 2

Rectangle {
    color: colors.cell_wall
    onWidthChanged: resizeToFit()
    onHeightChanged: resizeToFit()
    clip: true

    property bool drawingEnabled: false
    // TODO State enum
    property int drawingResult: 0
    readonly property int cellSize: 24
    readonly property int fullCellSize: cellSize + 1

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
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton

            property int last_row: 0
            property int last_col: 0

            onPressed:
                (mouse) => {
                    last_row = Math.floor(mouse.y / fullCellSize)
                    last_col = Math.floor(mouse.x / fullCellSize)
                    field.drawingResult = mouse.button === Qt.LeftButton;
                    field.drawingEnabled = true;
                }

            onReleased:
                (mouse) => {
                    field.drawingEnabled = false;
                }

            onPositionChanged:
                (mouse) => {
                    let row = Math.floor(mouse.y / fullCellSize)
                    let col = Math.floor(mouse.x / fullCellSize)

                    let row_step = last_row < row ? 1 : -1
                    let col_step = last_col < col ? 1 : -1

                    let col_k = 0
                    let max_k = Math.abs((row - last_row) / (col - last_col))
                    let cur_row = last_row
                    let cur_col = last_col

                    while (true) {
                        _fieldModel.setStateAt(cur_row, cur_col, drawingResult)

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

    function resizeToFit() {
        const rows = Math.round((height + table.rowSpacing) / (cellSize + table.rowSpacing)) - 1
        const columns = Math.round((width + table.columnSpacing) / (cellSize + table.columnSpacing)) - 1
        if ((rows !== table.rows) || (columns !== table.columns)) {
            _fieldModel.resize(rows, columns)
        }
    }
}
